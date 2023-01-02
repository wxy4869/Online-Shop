class WelcomeController < ApplicationController
  layout "main"

  def index
    @products = Product.all.order("status ASC").order("created_at DESC")
  end
end
