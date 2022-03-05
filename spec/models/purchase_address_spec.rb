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
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空だと保存できないこと' do
        @purchase_address.postal_code = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが「3桁ハイフン4桁」の半角数値でないと保存できないこと' do
        @purchase_address.postal_code = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it 'prefectureが空だと保存できないこと' do
        @purchase_address.prefecture_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefectureが「---」だと保存できないこと' do
        @purchase_address.prefecture_id = '1'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @purchase_address.city = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end
      it 'blockが空だと保存できないこと' do
        @purchase_address.block = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Block can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @purchase_address.phone_number = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが10桁または11桁でないと保存できないこと' do
        @purchase_address.phone_number = '090123456'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is too short")
      end
      it 'phone_numberが半角数値でないと保存できないこと' do
        @purchase_address.phone_number = '１２３４５６７８９０'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid. Input only number")
      end
      it 'phone_numberにハイフンがあると保存できないこと' do
        @purchase_address.phone_number = '090-1234-5678'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid. Input only number")
      end
      it 'user_idが紐付いていないと保存できないこと' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idがないと保存できないこと' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
