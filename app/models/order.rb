class Order < ApplicationRecord
  belongs_to :purchase_history

  #配送先のvalidationを書く
  #購入するたびに入力すること,郵便番号、都道府県、市区町村、番地、電話番号は必須条件
  # with_options presence: true do
  #   validates :zip_code, :prefecture_id, :municipality, :address, :phone_number

  #   with_options numericality: { other_than: 0 } do
  #     validates :prefecture_id
  #   end
  # end

  # #郵便番号はハイフンありの半角数字の7桁
  # validates :zip_code, format: {with: /\d{3}[-]\d{4}/, message: 'is invalid,Input half-width numbers with hyphen'}

  # #電話番号は11桁の数値のみ
  # with_options numericality: {only_integer: true} do
  #   validates :phone_number, format: {with: /\d{11}/, message: 'is invalid.Input half-width alphanumeric.'}
  # end
end
