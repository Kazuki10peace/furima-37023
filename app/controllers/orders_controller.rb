class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @order_history = OrderHistory.new
    @item = Item.find(params[:item_id])
    @address = Address.new
    redirect_to root_path if current_user.id == @item.user.id
  end

  def new
    @order_history_address = OrderHistoryAddress.new
  end

  def create
    @order_history_address = OrderHistoryAddress.new(order_history_params)
    if @order_history_address.valid?
      pay_item
      @order_history_address.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_history_params
    params.require(:order_history_address).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(
      user_id: current_user.id, token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      card: order_history_params[:token],
      currency: 'jpy'
    )
  end
end
