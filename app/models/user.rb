class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :products

  with_options presence: true do
    validates :nickname
    validates :password_confirmation
    validates :family_name
    validates :second_name
    validates :reader_family_name
    validates :reader_second_name
    validates :birthday
  end
end