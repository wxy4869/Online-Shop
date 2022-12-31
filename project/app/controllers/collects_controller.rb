class CollectsController < ApplicationController
  layout "main"
  before_action :set_collect, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /collects or /collects.json
  def index
    @products = Product.find_by_sql("SELECT products.* FROM products INNER JOIN collects ON collects.product_id = products.id WHERE collects.user_id = #{current_user.id}")
    if @products.empty?
      flash[:notice] = "您还没有收藏过商品哦"
    end
  end

  # GET /collects/1 or /collects/1.json
  def show
  end

  # GET /collects/new
  def new
    @collect = Collect.new
  end

  # GET /collects/1/edit
  def edit
  end

  # POST /collects or /collects.json
  def create
    @collect = Collect.new(collect_params)

    respond_to do |format|
      if @collect.save
        format.html { redirect_to collects_url, notice: "成功加入收藏夹" }
        format.json { render :show, status: :created, location: @collect }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @collect.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /collects/1 or /collects/1.json
  def update
    respond_to do |format|
      if @collect.update(collect_params)
        format.html { redirect_to collect_url(@collect), notice: "Collect was successfully updated." }
        format.json { render :show, status: :ok, location: @collect }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @collect.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /collects/1 or /collects/1.json
  def destroy
    @collect.destroy

    respond_to do |format|
      format.html { redirect_to collects_url, notice: "成功取消收藏" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_collect
      @collect = Collect.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def collect_params
      params.require(:collect).permit(:user_id, :product_id)
    end
end
