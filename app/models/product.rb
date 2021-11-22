class Product < ApplicationRecord
  belongs_to :user
  has_many :deals
  validates :name, length: { minimum: 4, maximum: 20 }, uniqueness: true, presence:true
  validates :amount, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than: 1000}
end
