class Product < ApplicationRecord
  require 'carrierwave/orm/activerecord'
  mount_uploader :image, ImageUploader
  serialize :images, JSON # If you use SQLite, add this line.
  belongs_to :user
  has_many :deals, through: :user
  validates :name, length: { minimum: 4, maximum: 20 }, uniqueness: true, presence: true
  validates :amount, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than: 1000 }
end
