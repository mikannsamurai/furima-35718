class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :estimated_shipping_date
  belongs_to :prefecture
  belongs_to :product_condition
  belongs_to :shipping_fee_burden

  has_one_attached :image

  with_options presence: true do
    with_options format: { with: /\A([ぁ-んァ-ン一-龥々]|ー)+\z/} do
  validates :name, length: { maximum: 40 }
  validates :text, length: { maximum: 1000 }
    end
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  end
  with_options numericality: { other_than: 1 } do
  validates :category_id
  validates :estimated_shipping_date_id
  validates :prefecture_id
  validates :product_condition_id
  validates :shipping_fee_burden_id
  end
end
