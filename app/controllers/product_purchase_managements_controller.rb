class ProductPurchaseManagementsController < ApplicationController

  def index
    @product_purchase_management = ProductPurchaseManagement.new
    @item = Item.find(params[:item_id])
  end

  def create
    @product_purchase_management = ProductPurchaseManagement.new(product_purchase_management_params)
    if @product_purchase_management.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def product_purchase_management_params
    params.require(order_form).permit(:municipalities, :address, :postal_coke, :phone_number, :prefecture_id)
                                      .merge(user_id: current_user.id )
  end
end