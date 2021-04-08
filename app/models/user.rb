class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :products

  VALID_PASSWORD_REGEX =/\A[a-zA-Z0-9]+\z/

  with_options presence: true do
    validates :nickname
    validates :family_name ,format: { with: /\A[ぁ-んァ-ン一-龥々]/, message: "is invalid. Input full-width characters." }
    validates :second_name ,format: { with: /\A[ぁ-んァ-ン一-龥々]/, message: "is invalid. Input full-width characters." }
    validates :reader_family_name ,format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width  katakana characters." }
    validates :reader_second_name ,format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width  katakana characters." }
    validates :birthday
    validates :password,format: {with: VALID_PASSWORD_REGEX,message: "is invalid.Input half-width characters."}
  end
end