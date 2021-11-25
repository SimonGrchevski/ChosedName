class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :products
  has_many :deals
  validates :name, length: { minimum: 4, maximum: 20 }, presence: true
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true, length: { minimum: 6, maximum: 50 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
end
