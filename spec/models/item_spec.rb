require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品できる時' do
      it 'nameとtextとpriceとcategory_idとproduct_condition_idとshipping_fee_burden_idと
          prefecture_idとestimated_shipping_date_idが存在すれば登録できる' do
          binding.pry
        expect(@item).to be_valid
      end
    end
    context '商品出品できない時' do
      it '商品画像がない時' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空の時' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'textが空の時' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it 'category_idが"0"のとき' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 0')
      end
      it 'product_condition_idが"0"の時' do
        @item.product_condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Product condition must be other than 0')
      end
      it 'shipping_fee_burden_idが"0"のとき' do
        @item.shipping_fee_burden_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping fee burden must be other than 0')
      end
      it 'prefecture_idが"0"の時' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 0')
      end
      it 'estimated_shipping_date_idが"0"の時' do
        @item.estimated_shipping_date_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Estimated shipping date must be other than 0')
      end
      it 'priceが空の時' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが300より小さい時' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it 'priceが9999999より大きい時' do
        @item.price = 100_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it 'priceは半角数字でないと保存できない' do
        @item.price = '１１１１１１'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it '半角英数混合では登録できない' do
        @item.price = '1qqww111'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it '半角英語だけでは登録できないこと' do
        @item.price = 'qqqqqqqq'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end
