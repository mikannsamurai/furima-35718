class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :estimated_shipping_date
  belongs_to :prefecture
  belongs_to :product_condition
  belongs_to :shipping_fee_burden

  has_one_attached :image
end
