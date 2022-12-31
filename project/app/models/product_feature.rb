class ProductFeature < ApplicationRecord
  belongs_to :product
  has_many :users, through: :carts
end
