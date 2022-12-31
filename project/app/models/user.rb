class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :recoverable, :rememberable, :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable
  validates_uniqueness_of :username

  has_many :orders
  has_many :product_features, through: :carts
  has_many :product, through: :collects

  protected

  def email_required?
    false
  end
end
