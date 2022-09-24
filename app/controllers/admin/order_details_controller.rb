class Admin::OrderDetailsController < ApplicationController

  def index
    @order_details = Order_details.all

  end

  def new
  end

  def created
  end

  def update
  end
end
