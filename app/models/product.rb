class Product < ApplicationRecord
  #テーブル間のアソシエーション（user_idはpresence: trueしなくともよい＝つながっているからデフォルトでなる）
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_condition
  belongs_to :shipping_charges
  belongs_to :estimated_shipping_date
  belongs_to :prefecture

  #スクロールバーの選択で「ーー」のときは保存できないようにする記述
  #ひとつのvalidatesに複数のカラムを入れても良い！
  with_options numericality: { other_than: 0} do
    validates :category_id, :product_condition_id, :shipping_charges_id, :estimated_shipping_date_id, :prefecture_id
  end

  with_options numericality:{ only_integer: true, greater_than: 299, less_than: 10000000} do
    validates :price, format: {with: /\A[0-9]+\z/,message: "is invalid.Input half-width alphanumeric."}
  end

  with_options presence: true do
    validates :name, :category_id , :product_condition_id, :shipping_charges_id, :estimated_shipping_date_id, :prefecture_id, :price, :text, :image
  end

  # 下記のコードは画像があれば表示、なければ画像を表示させるというコード
  #今回は画像を入力しないとnewアクションへ戻るから必要ない
  # validates :image, presence: true, unless: :was_attached?

  # def was_attached?
  #   self.image.attached?
  # end
end
