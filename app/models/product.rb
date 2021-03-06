class Product < ApplicationRecord
  # テーブル間のアソシエーション（user_idはpresence: trueしなくともよい＝つながっているからデフォルトでなる）
  belongs_to :user
  has_many_attached :images
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_condition
  belongs_to :shipping_charges
  belongs_to :estimated_shipping_date
  belongs_to :prefecture
  has_one    :purchase_history

  # スクロールバーの選択で「ーー」のときは保存できないようにする記述
  # ひとつのvalidatesに複数のカラムを入れても良い！
  # 全てに共通する条件を全体に反映することができる！
  with_options presence: true do
    validates :name, :category_id, :product_condition_id, :shipping_charges_id, :estimated_shipping_date_id, :prefecture_id,
              :text, :images

    with_options numericality: { other_than: 0 } do
      validates :category_id, :product_condition_id, :shipping_charges_id, :estimated_shipping_date_id, :prefecture_id
    end

    with_options numericality: { only_integer: true, greater_than: 299, less_than: 10_000_000 } do
      validates :price, format: { with: /\A[0-9]+\z/, message: 'is invalid.Input half-width alphanumeric.' }
    end
  end
end
