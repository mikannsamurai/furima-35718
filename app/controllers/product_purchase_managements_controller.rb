class ProductPurchaseManagementsController < ApplicationController
  before_action :authenticate_user!, only:[:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :move_to_action, only: :index

  def index
    @buyer_product_purchase_management = BuyerProductPurchaseManagement.new
  end

  def create
    @buyer_product_purchase_management = BuyerProductPurchaseManagement.new(buyer_product_purchase_management_params)
    if @buyer_product_purchase_management.valid?
      pay_item
      @buyer_product_purchase_management.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buyer_product_purchase_management_params
    params.require(:buyer_product_purchase_management).permit(:municipalities, :address, :postal_coke, :building_name_and_room_number,
                                                              :phone_number, :prefecture_id, :product_purchase_management_id).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def move_to_action
    redirect_to root_path if @item.product_purchase_management.present? || current_user.id == @item.user.id
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: buyer_product_purchase_management_params[:token],
      currency: 'jpy'
    )
  end
end
