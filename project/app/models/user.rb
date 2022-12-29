class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :recoverable, :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, :validatable

  has_many :orders
  has_many :product_features, through: :carts
  has_many :product_features, through: :collects

  protected

  def email_required?
    false
  end
end
