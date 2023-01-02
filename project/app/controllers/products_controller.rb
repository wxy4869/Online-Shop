require 'digest/md5.so'

class ProductsController < ApplicationController
  layout "main"
  before_action :set_product, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: %i[ new edit ]
  before_action :authenticate_admin, only: %i[ new edit ]

  # GET /products or /products.json
  def index
    @products = Product.all.order("status ASC").order("created_at DESC")
  end

  # GET /products/1 or /products/1.json
  def show
    if user_signed_in?
      @collect = Collect.find_by(user_id: current_user.id, product_id: @product.id)
    end
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)
    @product.save

    uploaded_io = params[:product][:picture]
    file_name = Digest::MD5.hexdigest(@product.id.to_s + uploaded_io.original_filename) + ".png"
    File.open(Rails.root.join('app', 'assets', 'images', 'product', file_name), 'wb') do |file|
      file.write(uploaded_io.read)
    end
    @product.url = "product/" + file_name
    @product.save

    params[:feature_name].each do |feature_name|
      @product_feature = ProductFeature.new(feature_name: feature_name, product_id: @product.id)
      @product_feature.save
    end

    respond_to do |format|
      format.html { redirect_to products_url, notice: "商品添加成功" }
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    uploaded_io = params[:product][:picture]
    file_name = Digest::MD5.hexdigest(@product.id.to_s + uploaded_io.original_filename) + ".png"
    File.open(Rails.root.join('app', 'assets', 'images', 'product', file_name), 'wb') do |file|
      file.write(uploaded_io.read)
    end
    @product.url = "product/" + file_name
    @product.save

    @product.update(product_params)

    @product.product_features.each do |product_feature|
      product_feature.destroy
    end

    params[:feature_name].each do |feature_name|
      @product_feature = ProductFeature.new(feature_name: feature_name, product_id: @product.id)
      @product_feature.save
    end

    respond_to do |format|
      format.html { redirect_to products_url, notice: "商品修改成功" }
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def search
    @products = Product.where("product_name LIKE '%#{params[:keyword]}%'").order("status ASC").order("created_at DESC")
  end

  def updateStatus
    @product = Product.find(params[:product_id])
    @product.status = params[:status]
    @product.save

    respond_to do |format|
      format.html { redirect_to products_url }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:product_name, :detail, :price)
    end
end
