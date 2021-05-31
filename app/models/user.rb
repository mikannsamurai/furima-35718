class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,              presence: true
  validates :email,                 presence: true
  validates :password,              format: { with: /\A[a-z0-9]+\z/i  }
  validates :password_confirmation, presence: true
  validates :first_name_full_width, presence: true, format: { with: /\A([ぁ-んァ-ン一-龥]|ー)+\z/}
  validates :last_name_full_width,  presence: true, format: { with: /\A([ぁ-んァ-ン一-龥]|ー)+\z/}
  validates :first_name_katakana,   presence: true, format: { with: /\A([ァ-ン]|ー)+\z/}
  validates :last_name_katakana,    presence: true, format: { with: /\A([ァ-ン]|ー)+\z/}
  validates :birthday,              presence: true
  
end