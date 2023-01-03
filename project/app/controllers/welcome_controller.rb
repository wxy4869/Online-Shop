class WelcomeController < ApplicationController
  layout "main"
  before_action :authenticate_user!, only: %i[ center ]

  def index
    @products = Product.all.order("status ASC").order("sales DESC").order("created_at DESC")
  end

  def center
    @collect_cnt = Collect.where(user_id: current_user.id).count
    @cart_cnt = Cart.where(user_id: current_user.id).count
    @order_cnt = Order.where(user_id: current_user.id).count
    @product_id = if Product.all.length == 0
      0
    else
      rand(1..10000) % Product.all.length + 1
    end
  end
end
