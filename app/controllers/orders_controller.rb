class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create]

  def index
    redirect_to root_path if @item.user_id == current_user.id || !@item.order_history.nil?
    @order_history_address = OrderHistoryAddress.new
  end

  def create
    @order_history_address = OrderHistoryAddress.new(address_params)
    if @order_history_address.valid?
      pay_item
      @order_history_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def address_params
    params.require(:order_history_address).permit(:postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :order_history_id).merge(
      item_id: params[:item_id], user_id: current_user.id, token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: Item.find(params[:item_id]).price,
      card: address_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
