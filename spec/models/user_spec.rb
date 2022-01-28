require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nicknameとemail、passwordとpassword_confirmation、last_nameとfirst_name、last_name_kanaとfirst_name_kana、birth_dateが存在すれば登録できる' do
    end
    it 'nicknameが空では登録できない' do
    end
    it 'emailが空では登録できない' do
    end
    it 'passwordが空では登録できない' do
    end
    it 'last_nameが空では登録できない' do
    end
    it 'first_nameが空では登録できない' do
    end
    it 'last_name_kanaが空では登録できない' do
    end
    it 'first_name_kanaが空では登録できない' do
    end
    it 'birth_dateが空では登録できない' do
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
    end
    it '重複したemailが存在する場合は登録できない' do
    end
    it 'emailは@を含まないと登録できない' do
    end
    it 'passwordが5文字以下では登録できない' do
    end
    it 'passwordが129文字以上では登録できない' do
    end
    it 'passwordが英数字混合でないと登録できない' do
    end
    it 'last_nameは全角（漢字、ひらがな、カタカナ）でないと登録できない'
    end
    it 'first_nameは全角（漢字、ひらがな、カタカナ）でないと登録できない'
    end
    it 'last_name_kanaは全角カタカナでないと登録できない'
    end
    it 'first_name_kanaは全角カタカナでないと登録できない'
    end
  end
end
