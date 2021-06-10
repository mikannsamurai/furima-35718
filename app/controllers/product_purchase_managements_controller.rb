class ProductPurchaseManagementsController < ApplicationController
  def index
    product_purchase_management = ProductPurchaseManagement.new
    @item = Item.find(params[:item_id])
  end
end