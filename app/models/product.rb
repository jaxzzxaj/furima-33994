class Product < ApplicationRecord
  #テーブル間のアソシエーション（user_idはpresence: trueしなくともよい＝つながっているからデフォルトでなる）
  belongs_to :user
  has_one_attached :image

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
