class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :birthday
    validates :password,              format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
    with_options format: { with: /\A([ぁ-んァ-ン一-龥]|ー)+\z/} do
      validates :first_name_full_width
      validates :last_name_full_width
    end
    with_options format: { with: /\A([ァ-ン]|ー)+\z/} do
      validates :first_name_katakana
      validates :last_name_katakana
    end
  end
end

