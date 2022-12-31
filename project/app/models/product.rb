class Product < ApplicationRecord
  has_many :product_features
  has_many :users, through: :collects
end
