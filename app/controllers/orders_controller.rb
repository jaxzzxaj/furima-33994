class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :move_to_index, only: [:index,:create]

  def index
    @product = Product.find(params[:product_id])
    @perchase_order = PerchaseOrder.new
  end

  def create
    # binding.pry
    @perchase_order = PerchaseOrder.new(order_params)
    @product = Product.find(params[:product_id])
    if @perchase_order.valid?
      paying
      @perchase_order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:perchase_order).permit(:zip_code, :prefecture_id, :municipality, :adress, :building_name,
                                           :phone_number).merge(user_id: current_user.id, token: params[:token], product_id: params[:product_id])
  end

  def paying
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @product.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    @product = Product.find(params[:product_id])
    if @product.user.id == current_user.id
      redirect_to '/'
    end
  end
end
