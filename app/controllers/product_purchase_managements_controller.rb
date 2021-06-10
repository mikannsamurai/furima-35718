class ProductPurchaseManagementsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create, :move_to_action]
  before_action :move_to_action, only: :index

  def index
    @buyer_product_purchase_management = BuyerProductPurchaseManagement.new
  end

  def create
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
    params.require(:buyer_product_purchase_management).permit(:municipalities, :address, :postal_coke, :phone_number, :prefecture_id)
    .merge(user_id: current_user.id, item_id: @item.id)
  end

  def move_to_action
    redirect_to root_path if current_user.id == @item.user.id
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end