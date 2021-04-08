##class ProductsController < ApplicationController
  #未ログインuserのみ特定のアクションを制限する設定
  #before_action :move_to_index, except: :index
  #下記の記述で@productsの中にすべてのproductテーブルのレコードを取得する。
  # def index
  #  @products = Product.includes(:user)
  # end

  #下記の記述でnewアクションで記入したuserのすべてのレコード＋ユーザのidを取得。
  # def new
  #   @user=User.find(user_params)
  # end

  # private

  # def user_params
  #   params.require(:user).permit(:nickname,:family_name, :second_name, :reader_family_name, :reader_second_name,:birthday).merge(user_id: current_user.id)
  # end

  # def move_to_index
  #   unless user_signed_in?
  #     redirect_to action: :index
  #   end
  # end
  #end
