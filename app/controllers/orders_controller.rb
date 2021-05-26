class OrdersController < ApplicationController
  #before_action :authenticate_user!, except: [:index]
  # before_action :redirect_product_user, only: [:index,:create]

  def index
    @product = Product.find(params[:product_id])
  end

  def create
  end

  private

  def product_params
    params.require(:product).permit(:name, :category_id, :product_condition_id, :shipping_charges_id, :estimated_shipping_date_id,
                                    :prefecture_id, :price, :text, :image).merge(user_id: current_user.id)
  end

  def find_params
    @product = Product.find(params[:id])
  end

  def then_redirect
    redirect_to '/' unless current_user.id != @product.user_id
  end
end
