class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.page(params[:page]).per(10)
    # @orders = Customer.find(params[:id])
    # @order = Order.find(params[:id])
  end

  def crate
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
  end

  private
    def order_params
      params.require(:item).permit(:customer_id, :post_number, :address, :name, :shipping_cost, :total_payment, :payment_method, :order_status)
    end


end
