class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :products
  has_many :deals
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
