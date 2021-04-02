class ProductsController < ApplicationController
  #下記の記述で@productsの中にすべてのproductテーブルのレコードを取得する。
  def index
    @products = Product.all
  end

end
