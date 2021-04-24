class Product < ApplicationRecord
  #テーブル間のアソシエーション（user_idはpresence: trueしなくともよい＝つながっているからデフォルトでなる）
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre

  #スクロールバーの選択で「ーー」のときは保存できないようにする記述
  #ひとつのvalidatesに複数のカラムを入れても良い！
  vwith_options numericality: { other_than: 0} do
    validates :category_id, :product_condition_id, :shipping_charges_id, :estimated_shipping_date_id, :prefecture_id
  end

  with_options numericality:{ only_integer: true, greater_than: 300, less_than: 9999999},format: {with: /\A[A-Za-z]\w*\z/} do
    validates :price
  end


  with_options presence: true do
    validates :name, :category_id , :product_condition_id, :shipping_charges_id, :estimated_shipping_date_id, :prefecture_id, :price, :text
  end
end
