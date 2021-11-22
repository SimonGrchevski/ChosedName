class ProductDeal < ApplicationRecord
  belongs_to :product
  belongs_to :deal
end
