class Product < ApplicationRecord
  #テーブル間のアソシエーション（user_idはpresence: trueしなくともよい＝つながっているからデフォルトでなる）
  #belongs_to :user

  # with_options presence: true do
  #   validates :name
  #   validates :category_id
  #   validates :shipping_charges_id
  #   validates :estimated_shipping_date_id
  #   validates :prefecture
  #   validates :price
  #   validates :text
  # end
end
