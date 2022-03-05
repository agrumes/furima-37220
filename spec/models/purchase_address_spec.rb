require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do

  before do
    user = FactoryBot.create(:user)
    @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id)
  end

  describe '商品購入、配送先の保存' do
   context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_address).to be_valid
      end
      it 'tokenがあれば保存ができること' do
        @purchase_address.token = 'abc123'
        expect(@purchase_address).to be_valid
      end
      it 'postal_codeが「3桁ハイフン4桁」の半角数値であれば保存ができること' do
        @purchase_address.postal_code = '123-4567'
        expect(@purchase_address).to be_valid
      end
      it 'prefectureを「---」以外で選択していれば保存ができること' do
        @purchase_address.prefecture_id = '2'
        expect(@purchase_address).to be_valid
      end
      it 'cityがあれば保存ができること' do
        @purchase_address.city = '港区'
        expect(@purchase_address).to be_valid
      end
      it 'blockがあれば保存ができること' do
        @purchase_address.block = '六本木6-10-1'
        expect(@purchase_address).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @purchase_address.building = nil
        expect(@purchase_address).to be_valid
      end
      it 'phone_numberが10桁または11桁の半角数値かつハイフンがなければ保存ができること' do
        @purchase_address.phone_number = '09012345678'
        expect(@purchase_address).to be_valid
      end
      it 'item_idがあれば保存できること' do
        @purchase_address.item_id = '10'
        expect(@purchase_address).to be_valid
      end
      it 'user_idがあれば保存できること' do
        @purchase_address.user_id = '30'
        expect(@purchase_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'tokenが空だと保存できないこと' do
      end
      it 'postal_codeが空だと保存できないこと' do
      end
      it 'postal_codeが「3桁ハイフン4桁」の半角数値でないと保存できないこと' do
      end
      it 'prefectureが空だと保存できないこと' do
      end
      it 'prefectureが「---」だと保存できないこと' do
      end
      it 'cityが空だと保存できないこと' do
      end
      it 'blockが空だと保存できないこと' do
      end
      it 'phone_numberが空だと保存できないこと' do
      end
      it 'phone_numberが10桁または11桁でないと保存できないこと' do
      end
      it 'phone_numberが半角数値でないと保存できないこと' do
      end
      it 'phone_numberにハイフンがあると保存できないこと' do
      end
      it 'user_idが紐付いていないと保存できないこと' do
      end
      it 'item_idがないと保存できないこと' do
      end
    end
  end
end
