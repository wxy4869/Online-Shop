class CartsController < ApplicationController
  layout "main"
  before_action :set_cart, only: %i[ show edit update destroy myDestroy ]
  before_action :authenticate_user!

  # GET /carts or /carts.json
  def index
    @items = Product.find_by_sql(
        "SELECT * FROM products
        INNER JOIN product_features ON products.id = product_features.product_id
        INNER JOIN carts ON product_features.id = carts.product_feature_id
        WHERE carts.user_id = #{current_user.id}
        ORDER BY products.status ASC, carts.created_at DESC")
  end

  # GET /carts/1 or /carts/1.json
  def show
  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts or /carts.json
  def create
    @cart = Cart.new(cart_params)

    respond_to do |format|
      if @cart.save
        format.html { redirect_to carts_url, notice: "成功加入购物车" }
        format.json { render :show, status: :created, location: @collect }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carts/1 or /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to carts_url, notice: "修改成功" }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1 or /carts/1.json
  def destroy
    @cart.destroy

    respond_to do |format|
      format.html { redirect_to carts_url, notice: "成功移出购物车" }
      format.json { head :no_content }
    end
  end

  def myUpdate
    @cart = Cart.find(params[:cart_id])
    @product = Product.find(params[:product_id])
    @cart.destroy

    respond_to do |format|
      format.html { redirect_to product_url(@product), notice: "请重新选择样式和数量并添加到购物车" }
      format.json { head :no_content }
    end
  end

  def myDestroy
    @cart = Cart.find(params[:id])
    @cart.destroy

    respond_to do |format|
      format.html { redirect_to carts_url, notice: "成功移出购物车" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cart_params
      params.require(:cart).permit(:id, :user_id, :product_feature_id, :num)
    end
end
