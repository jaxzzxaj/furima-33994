class ProductsController < ApplicationController
  #未ログインuserのみ特定のアクションを制限する設定
  before_action :move_to_index, except: :index
  #下記の記述で@productsが新規投稿順に並ぶようにしている。
  def index
    @product = Product.includes(:user)
    @products = Product.order("ceated_at DESK")
  end

  #下記の記述でnewアクションで記入したuserのすべてのレコード＋ユーザのidを取得。
  # def new
  #   @user=User.find(user_params)
  # end
  #下記の記述でnew.html.erb内のform_withで変数が必要だから設定する。
  def new
    @user=User.new
  end

  #下記の記述でnew.htmlでform_withで取得したデータをDBに保存してindexへ遷移するように設定。
  #上で設定したuserのカラム・レコードのidを取得はこっちであるべき？
  def create
    @user=create(user_params)
    root to "/"
  end

  private


  def user_params
    params.require(:product).permit(:name,:category_id,:product_condition_id,:shipping_charges_id,:estimates_shipping_date_id,:prefecture_id,:price,:text,:image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
