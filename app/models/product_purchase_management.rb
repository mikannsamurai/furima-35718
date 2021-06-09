class ProductPurchaseManagement < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_many :buyer
end
