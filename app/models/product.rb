class Product < ApplicationRecord
  #テーブル間のアソシエーション（user_idはpresence: trueしなくともよい＝つながっているからデフォルトでなる）
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre

  #スクロールバーの選択で「ーー」のときは保存できないようにする記述
  validates :genre_id, numericality: { other_than: 0}


  with_options presence: true do
    validates :name
    validates :category_id
    validates :product_condition_id
    validates :shipping_charges_id
    validates :estimated_shipping_date_id
    validates :prefecture_id
    validates :price
    validates :text
  end
end
