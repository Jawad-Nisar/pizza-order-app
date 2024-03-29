class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy enable_complete ]

  def index
    @orders = Order.all
  end

  def show
  end

  def new
    @order = Order.new
  end

  def edit
  end

  def create
    total_price = 0
    @order = Order.new(order_params)
    topings = Toping.where(id: order_params[:topings_id])
    items = Item.where(id: order_params[:items_id])
    topings.each do |toping|
      total_price = total_price + toping.price
    end
    items.each do |item|
      total_price = total_price + item.price
    end
    
    @order.total_price = total_price

    respond_to do |format|
      if @order.save
        format.html { redirect_to order_url(@order), notice: "Order was successfully created." }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    total_price = 0
    @order = Order.new(order_params)
    topings = Toping.where(id: order_params.topings_id)
    items = Item.where(id: order_params.items_id)
    topings.each do |toping|
      total_price = total_price + toping.price
    end
    items.each do |item|
      total_price = total_price + item.price
    end
    
    @order.total_price = total_price
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

  def destroy
    @order.destroy!

    respond_to do |format|
      format.html { redirect_to orders_url, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def enable_complete
    @order.update(completed: true)
    if @order.save
      render json: "status updated", status: :success
    else
      render json: "not updated", status: :unprocessable_entity
    end 
  end
  

  private
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:completed, :promotion_code, :discount_code, :topings_id, :items_id)
    end
end
