require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '新規商品出品' do
    context '商品が出品できる場合' do
      it '全ての項目が存在すれば登録できる' do
      end
      it 'priceが半角数字なら保存できる' do
      end
    end

    context '商品が出品できない場合' do
      it 'item_imageが空では保存できない' do
      end
      it 'item_nameが空では保存できない' do
      end
      it 'item_explanationが空では保存できない' do
      end
      it 'category_idが空では保存できない' do
      end
      it 'category_idが「1」では保存できない' do
      end
      it 'condition_idが空では保存できない' do
      end
      it 'condition_idが「1」では保存できない' do
      end
      it 'delivery_charge_idが空では保存できない' do
      end
      it 'delivery_charge_idが「1」では保存できない' do
      end
      it 'prefecture_idが空では保存できない' do
      end
      it 'prefecture_idが「1」では保存できない' do
      end
      it 'delivery_day_idが空では保存できない' do
      end
      it 'delivery_day_idが「1」では保存できない' do
      end
      it 'priceが空では保存できない' do
      end
      it 'priceが300未満では保存できない' do
      end
      it 'priceが999999999より大きい数字では保存できない' do
      end
      it 'priceが全角数字では保存できない' do
      end
    end
  end
end
