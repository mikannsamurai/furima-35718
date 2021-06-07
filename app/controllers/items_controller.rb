class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :price, :text, :category_id, :product_condition_id, :shipping_fee_burden_id,
                                 :prefecture_id, :estimated_shipping_date_id).merge(user_id: current_user.id)
  end
end
