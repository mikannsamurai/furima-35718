class ProductPurchaseManagementsController < ApplicationController

  def index
    @product_purchase_management = ProductPurchaseManagement.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @buyer_product_purchase_management = BuyerProductPurchaseManagement.new(buyer_product_purchase_management_params)
    if @buyer_product_purchase_management.valid?
      @buyer_product_purchase_management.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def buyer_product_purchase_management_params
    params.permit(:municipalities, :address, :postal_coke, :phone_number, :prefecture_id)
    .merge(user_id: current_user.id, item_id: @item.id)
  end
end