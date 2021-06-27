class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :products
  has_many :purchase_histories
  has_one  :order

  with_options presence: true do
    validates :nickname
    validates :family_name, :second_name, format: { with: /\A[ぁ-んァ-ン一-龥々]/, message: '全角で入力してください' }
    validates :reader_family_name, :reader_second_name,
              format: { with: /\A[ァ-ヶー－]+\z/, message: 'カタカナで入力してください' }
    validates :password,
              format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: '半角で入力してください' }
    validates :birthday
  end
end
