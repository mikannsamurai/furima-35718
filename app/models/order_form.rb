class OrderForm
  include ActiveModel::Model
  attr_accessor :prefecture_id, :municipalities, :address, :building_name_and_room_number, :product_purchase_management,
                :postal_coke, :phone_number, :user_id

  with_options presence: true do
    with_options format: {with: /\A([ぁ-んァ-ン一-龥々]|ー)+\z/} do
      validates :municipalities
      validates :address
    end
  validates :user_id
  validates :postal_coke, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid.Include hyphen(-)"}
  validates :phone_number, format: {with: /\A[0]{1}\d{9,10}\z/}
  end
  validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
  
  def save
    product_purchase_management = Product_purchase_management.create(item: item, user_id: user_id)
    Buyer.create(municipalities: municipalities, address: address, postal_coke: postal_coke, phone_number: phone_number, 
                 prefecture_id: prefecture_id, product_purchase_management_id: product_purchase_management.id )
end