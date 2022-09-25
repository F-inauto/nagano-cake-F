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
       #入金確認→製作ステータス：製作待ち
      @order.order_details.update_all(making_status: 1) if @order.order_status == "confirm_payment"
       #製作ステータス製作中→製作中
      # @order.update_all(making_status: 2) if @order.order_details.order_status == "making"
      #製作完了→発送準備
      # @order.update_all(order_status: 3) if @order.order_details.making_status == "complete"
      redirect_to admin_order_path(@order.id)
    else
      redirect_to admin_order_path(@order.id)
    end
  end




  private
    def order_params
      params.require(:order).permit(:customer_id, :post_number, :address, :name, :shipping_cost, :total_payment, :payment_method, :order_status, :amount)
    end
end