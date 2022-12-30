class WelcomeController < ApplicationController
  layout "main"

  def index
    @products = Product.all
  end
end
