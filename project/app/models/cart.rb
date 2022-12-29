class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :product_feature
end
