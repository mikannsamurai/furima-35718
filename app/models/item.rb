class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :estimated_shipping_date
  belongs_to :prefecture
  belongs_to :product_condition
  belongs_to :shipping_fee_burden

  has_one_attached :image

  with_options resence: true do
  validates :name
  validates :text
  validates :price
  end
  with_options numericality: { onther_than: 1 } do
  validates :category_id
  validates :estimated_shipping_date
  validates :prefecture
  validates :product_condition
  validates :shipping_fee_burden
  end
end
