class Admin::OrderDetailsController < ApplicationController

  def index
    @order_details = Order_details.all
  end

  def show
    @order = Order.find(params[:id])
    @order_details = Order_details.all
  end

  def creat
  end

  def update
    @order_details.update
  end
end
