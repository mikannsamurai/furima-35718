require 'rails_helper'

RSpec.describe ProductPurchaseManagement, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @buyer = FactoryBot.build(:buyer_product_purchase_management, user_id: user.id, item_id: item.id)
    sleep(1)
  end

  describe '商品購入機能' do
    context '商品が購入できる時' do
      it 'item_idとuser_idとprefecture_idとmunicipalitiesとaddressとproduct_purchase_management_idと
          postal_cokeとphone_numberとtokenが存在する時購入できる' do
        expect(@buyer).to be_valid
      end
    end
    context '購入できない時' do
      it 'item_idが空の時' do
        @buyer.item_id = ''
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Item can't be blank")
      end
      it 'user_idが空の時' do
        @buyer.user_id = ''
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("User can't be blank")
      end
      it 'prefectre_idが0の時' do
        @buyer.prefecture_id = 0
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include('Prefecture must be other than 0')
      end
      it 'municipalitiesが空の時' do
        @buyer.municipalities = ''
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'addressが空の時' do
        @buyer.address = ''
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Address can't be blank")
      end
      it 'postal_cokeが空の時' do
        @buyer.postal_coke = ''
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Postal coke can't be blank")
      end
      it 'postal_cokeに-(ハイフン)が含まれていない時' do
        @buyer.postal_coke = '2230089'
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include('Postal coke is invalid')
      end
      it 'phone_numberが空の時' do
        @buyer.phone_number = ''
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが11桁以上の時' do
        @buyer.phone_number = '111111111111'
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号は英数字混合では登録できない' do
        @buyer.phone_number = 'aa222222'
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号は全角では登録できない' do
        @buyer.phone_number = '１１１１１１１１'
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include('Phone number is invalid')
      end
      it 'tokenが空では登録できない' do
        @buyer.token = ''
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
