class ProductsController < ApplicationController
  # 未ログインuserを強制的にログインページへ遷移させる設定
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_params, only: [:show, :edit, :update, :destroy]
  before_action :then_redirect, only: [:edit, :update, :destroy]

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
    if @product.save
      redirect_to '/'
    else render :new
    end
  end

  # DBに保存したデータをshowに使えるようにしたい。
  def show
  end

  # 編集画面にもデータを持っていくようにする。
  def edit
  end

  # 編集した内容をDBに保存、不備があった場合はeditに戻る
  def update
    if @product.update(product_params) == true
      @product.update(product_params)
      redirect_to '/'
    else
      render :edit
    end
  end

  def destroy
    redirect_to '/' if @product.destroy
  end
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
  redirect_to '/' unless current_user.id == @product.user_id && @product.purchase_history.nil?
end
