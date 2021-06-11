require 'rails_helper'

RSpec.describe Buyer, type: :model do
  before do
    @buyer = FactoryBot.build(:buyer_product_purchase_management)
  end

  describe '商品購入機能' do
    context '商品が購入できる時' do
      it 'prefecture_idとmunicipalitiesとaddressとproduct_purchase_management_idと
          postal_cokeとphone_numberが存在する時購入できる' do
          expect(@buyer).to be_valid
      end
    end
    context '購入できない時'do
     it 'prefectre_idが0の時' do
       @buyer.prefecture_id = 0
       @buyer.valid?
       expect(@buyer.errors.full_messages).to include("Prefecture must be other than 0")
     end
     it 'municipalitiesが空の時' do
       @buyer.municipalities = ""
       @buyer.valid?
       expect(@buyer.errors.full_messages).to include("Municipalities can't be blank")
     end
     it 'addressが空の時' do
       @buyer.address = ""
       @buyer.valid?
       expect(@buyer.errors.full_messages).to include("Address can't be blank")
     end
     it 'postal_cokeが空の時' do
       @buyer.postal_coke = ""
       @buyer.valid?
       expect(@buyer.errors.full_messages).to include("Postal coke can't be blank")
     end
     it 'postal_cokeに-(ハイフン)が含まれていない時' do
       @buyer.postal_coke = '2230089'
       @buyer.valid?
       expect(@buyer.errors.full_messages).to include("Postal coke is invalid")
     end
     it 'phone_numberが空の時'do
       @buyer.phone_number = ""
       @buyer.valid?
       expect(@buyer.errors.full_messages).to include("Phone number can't be blank")
     end
     it 'phone_numberが11桁以上の時' do
       @buyer.phone_number = '111111111111'
       @buyer.valid?
       expect(@buyer.errors.full_messages).to include("Phone number is invalid")
     end
    end
  end
end
