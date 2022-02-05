require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '出品登録がうまくいくとき' do
      it 'image,name,info,category_id,sales_status_id,shipping_fee_id,prefecture_id,scheduled_delivery_id,priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '出品機能がうまくいかないとき' do
      it 'imageが空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messsages).to include("Image can't be blank")
      end
      it 'nameが空だと出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'infoが空だと出品できない' do
        @item.info = ''
        @item.valid?
        expect(@item.errors.full_messsages).to include("Info can't be blank")
      end
      it 'category_idが未選択だと出品できない' do
      end
      it 'sales_status_idが未選択だと出品できない' do
      end
      it 'shipping_fee_idが未選択だと出品できない' do
      end
      it 'prefecture_idが未選択だと出品できない' do
      end
      it 'schedule_delivary_idが未選択だと出品できない' do
      end
      it 'priceが空だと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messsages).to include("Price can't be blank")
      end
      it 'priceが全角数字だと出品できない' do
        @item.price = "２０００"
        @item.valid?
        expect(@item.errors.full_messsages).to include("")
      end
    end
  end
end