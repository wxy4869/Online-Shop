class OrdersController < ApplicationController
  layout "main"
  before_action :set_order, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /orders or /orders.json
  def index
    if current_user.status == 0
      @orders = Order.where(user_id: current_user.id)
    else
      @orders = Order.all
    end
  end

  # GET /orders/1 or /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders or /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        price = 0
        params[:cart_id].each do |cart_id|
          @cart = Cart.find(cart_id)
          @order_detail = OrderDetail.new(product_feature_id: @cart.product_feature_id, num: @cart.num, order_id: @order.id)
          @order_detail.save
          @product = Product.find_by_sql(
              "SELECT products.* FROM products
               INNER JOIN product_features ON products.id = product_features.product_id
               INNER JOIN carts ON product_features.id = carts.product_feature_id
               WHERE carts.id = #{@cart.id}").first
          @product.sales = @product.sales + @cart.num
          @product.save
          @cart.destroy
          price = price + @product.price * @order_detail.num
        end
        @order.price = price
        @order.save
        format.html { redirect_to orders_url, notice: "订单创建成功" }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to order_url(@order), notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    @order_details = OrderDetail.where(order_id: @order.id)
    @order_details.each do |order_detail|
      order_detail.destroy
    end
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url, notice: "成功删除订单" }
      format.json { head :no_content }
    end
  end

  def updateStatus
    @order = Order.find(params[:order_id])
    @order.status = params[:status]
    @order.save

    respond_to do |format|
      format.html { redirect_to orders_url }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.fetch(:order, {})
      params.require(:order).permit(:user_id, :real_name, :address, :telephone, :post_code, :status)
    end
end
