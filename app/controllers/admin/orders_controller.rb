class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all.page(params[:page]).per(10)
    # @orders = Customer.find(params[:id])
    # @order = Order.find(params[:id])
  end

  def create
    @order = Order.new(order_params)
    @order.save
  end

  def new
    @order = Order.new
  end

  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
       flash[:notice] = "注文ステータス更新"
       @order.order_details.update_all(order_status: 0) if @order.order_status == "wait_payment"
       @order.update_all(order_status: 1) if @order.order_details.order_status == "confirm_payment"
       @order.update_all(order_status: 2) if @order.order_details.order_status == "making"
       @order.update_all(order_status: 3) if @order.order_details.order_status == "preparing_ship"
       @order.update_all(order_status: 4) if @order.order_details.order_status == "finish_prepare:"
       redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end




  private
    def order_params
      params.require(:order).permit(:customer_id, :post_number, :address, :name, :shipping_cost, :total_payment, :payment_method, :order_status, :amount)
    end
end