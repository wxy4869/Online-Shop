class Product < ApplicationRecord
  validates :product_name, length: { minimum: 1,  maximum: 40 }
  validates :detail, length: { maximum: 200 }

  has_many :product_features
  has_many :users, through: :collects
end
