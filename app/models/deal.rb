class Deal < ApplicationRecord
  belongs_to :user
  validates :name, length: { minimum: 4, maximum: 20 }, presence: true
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  has_many :products, through: :user
end
