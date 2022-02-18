require 'rails_helper'

RSpec.describe OrderHistoryAddress, type: :model do
  before do
    @order_history_address = FactoryBot.build(:order_history_address)
  end

  describe '商品購入機能' do
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_history_address).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @order_history_address.building = ''
        expect(@order_history_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空では登録できないこと' do
        @order_history_address.postal_code = nil
        @order_history_address.valid?
        expect(@order_history_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeに-(ハイフン)が抜けては登録できない' do
        @order_history_address.postal_code = '1234567'
        @order_history_address.valid?
        expect(@order_history_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'prefecture_idが未選択では登録できないこと' do
        @order_history_address.prefecture_id = 1
        @order_history_address.valid?
        expect(@order_history_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空では登録できないこと' do
        @order_history_address.city = nil
        @order_history_address.valid?
        expect(@order_history_address.errors.full_messages).to include('City is invalid')
      end
      it 'cityが全角でないと保存できないこと' do
        @order_history_address.city = 'abc'
        @order_history_address.valid?
        expect(@order_history_address.errors.full_messages).to include('City is invalid')
      end
      it 'addressesが空では登録できないこと' do
        @order_history_address.addresses = nil
        @order_history_address.valid?
        expect(@order_history_address.errors.full_messages).to include("Addresses can't be blank")
      end
      it 'phone_numberが空では登録できないこと' do
        @order_history_address.phone_number = nil
        @order_history_address.valid?
        expect(@order_history_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが11文字でないと登録できない' do
        @order_history_address.phone_number = '1'
        @order_history_address.valid?
        expect(@order_history_address.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberが数字のみでないと登録できない' do
        @order_history_address.phone_number = '1-1'
        @order_history_address.valid?
        expect(@order_history_address.errors.full_messages).to include('Phone number is invalid')
      end
      it 'tokenが空では登録できないこと' do
        @order_history_address.token = nil
        @order_history_address.valid?
        expect(@order_history_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
