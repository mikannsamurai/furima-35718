require 'rails_helper'

RSpec.describe ProductPurchaseManagement, type: :model do
  before do
    @product_purchase_management = FactoryBot.build(:buyer_product_purchase_management)
  end

  describe '商品購入機能' do
    context '商品が購入できる時' do
      it 'item_idとuser_idがある時' do
        expect(@product_purchase_management).to be_valid
      end
    end
    context '商品が購入できない時' do
      it 'item_idが空の時' do
        @product_purchase_management.item_id = ""
        @product_purchase_management.valid?
        expect(@product_purchase_management.errors.full_messages).to include("Item can't be blank")
      end
      it 'user_idが空の時' do
        @product_purchase_management.user_id = ""
        @product_purchase_management.valid?
        expect(@product_purchase_management.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end
