require 'rails_helper'

RSpec.describe User, type: :model do 
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it 'nickname、email、passwprd、password_confirmation、last_name、first_name、last_name_kana、first_name_kana、birthdayが存在すれば登録できる' do
      end
      it 'passwordが6文字以上の半角英数字混合であれば登録できる' do
      end
      it 'first_nameが全角文字であれば登録できる' do
      end
      it 'last_nameが全角文字であれば登録できる' do
      end
      it 'first_name_kanaが全角カタカナであれば登録できる' do
      end
      it 'last_nam_kanaeが全角カタカナであれば登録できる' do
      end
    end
    context '新規登録できない場合' do
      it 'nicknameが空では登録できない' do
      end
      it 'emailが空では登録できない' do
      end
      it '重複したemailが存在する場合は登録できない' do
      end
      it 'emailは@を含まないと登録できない' do
      end
      it 'passwordが空では登録できない' do
      end
      it 'passwordが5文字以下であれば登録できない' do
      end
      it 'passwordが英数字混合でないと登録できない' do
      end
      it 'password_confirmationが空では登録できない' do
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
      end
      it 'last_nameが空では登録できない' do
      end
      it 'first_nameが空では登録できない' do
      end
      it 'last_name_kanaが空では登録できない' do
      end
      it 'first_name_kanaが空では登録できない' do
      end
      it 'last_nameが全角でなければ登録できない' do
      end
      it 'first_nameが全角でなければ登録できない' do
      end
      it 'last_name_kanaが全角カタカナでなければ登録できない' do
      end
      it 'first_name_kanaが全角カタカナでなければ登録できない' do
      end
      it 'birthdayが空では登録できない' do
      end
    end
  end 
end