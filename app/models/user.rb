class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :products

  with_options presence: true do
    validates :nickname
    validates :family_name, :second_name, format: { with: /\A[ぁ-んァ-ン一-龥々]/, message: 'is invalid. Input full-width characters.' }
    validates :reader_family_name, :reader_second_name,
              format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. Input full-width  katakana characters.' }
    validates :password,
              format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'is invalid.Input half-width characters.' }
    validates :birthday
  end
end
