class ProductsController < ApplicationController
  # 下記の記述で@productsが新規投稿順に並ぶようにしている。
  def index
    @products = Product.order('created_at DESC')
  end

  # 下記の記述でnew.html.erb内のform_withで変数が必要だから設定する。
  def new
    @product = Product.new
  end

  # 下記の記述でnew.htmlでform_withで取得したデータをDBに保存してindexへ遷移するように設定。
  def create
    @product = Product.new(product_params)
    # @products = @product.includes(:user)
    if @product.save
      redirect_to '/'
    else render :new
    end
  end

  # DBに保存したデータをshowに使えるようにしたい。
  def show
    @product = Product.find(params[:id])
  end

  private

  def product_params
    params.require(:product).permit(:name, :category_id, :product_condition_id, :shipping_charges_id, :estimated_shipping_date_id,
                                    :prefecture_id, :price, :text, :image).merge(user_id: current_user.id)
  end
end
