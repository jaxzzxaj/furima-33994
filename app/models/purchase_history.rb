class PurchaseHistory < ApplicationRecord
  belongs_to :product
  belongs_to :user
  has_one    :order

  # with_options presence: true do
  #   validates :credit_number, :expire_date, :security_code
  # end

  # #全クレジットカード対応の正規表現（4111111111111）
  # validates :credit_number, format: { with: /\A(?:4[0-9]{12}(?:[0-9]{3})?|5[1-5][0-9]{14}|6011[0-9]{12}|3(?:0[0-5]|[68][0-9])[0-9]{11}|3[47][0-9]{13})\z/}
  # #半角数字のみ
  # validates :expire_date,   format: { with: /\A[0-9]+\z/}
  # #半角数字のみ＋四桁まで
  # validates :security_code, format: { with: /\A[0-9]{4}+\z/}
end
