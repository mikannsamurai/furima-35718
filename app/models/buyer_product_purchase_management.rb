class BuyerProductPurchaseManagement
  include ActiveModel::Model
  attr_accessor :prefecture_id, :municipalities, :address, :building_name_and_room_number, :product_purchase_management,
                :postal_coke, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :municipalities
    validates :address
    validates :item_id
    validates :user_id
    validates :postal_coke, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :phone_number, format: {with: /\A[0-9]{0,11}\z/}
  end
    validates :prefecture_id, numericality: {other_than: 0 }

  def save
    product_purchase_management = ProductPurchaseManagement.create(item_id: item_id, user_id: user_id)
    Buyer.create(municipalities: municipalities, address: address, postal_coke: postal_coke, phone_number: phone_number,
                 prefecture_id: prefecture_id, building_name_and_room_number: building_name_and_room_number,
                 product_purchase_management_id: product_purchase_management.id )
  end
end