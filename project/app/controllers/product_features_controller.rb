class ProductFeaturesController < ApplicationController
  layout "main"
  before_action :set_product_feature, only: %i[ show edit update destroy ]

  # GET /product_features or /product_features.json
  def index
    @product_features = ProductFeature.all
  end

  # GET /product_features/1 or /product_features/1.json
  def show
  end

  # GET /product_features/new
  def new
    @product_feature = ProductFeature.new
  end

  # GET /product_features/1/edit
  def edit
  end

  # POST /product_features or /product_features.json
  def create
    @product_feature = ProductFeature.new(product_feature_params)

    respond_to do |format|
      if @product_feature.save
        format.html { redirect_to product_feature_url(@product_feature), notice: "Product feature was successfully created." }
        format.json { render :show, status: :created, location: @product_feature }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product_feature.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_features/1 or /product_features/1.json
  def update
    respond_to do |format|
      if @product_feature.update(product_feature_params)
        format.html { redirect_to product_feature_url(@product_feature), notice: "Product feature was successfully updated." }
        format.json { render :show, status: :ok, location: @product_feature }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product_feature.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_features/1 or /product_features/1.json
  def destroy
    @product_feature.destroy

    respond_to do |format|
      format.html { redirect_to product_features_url, notice: "Product feature was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_feature
      @product_feature = ProductFeature.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_feature_params
      params.fetch(:product_feature, {})
    end
end
