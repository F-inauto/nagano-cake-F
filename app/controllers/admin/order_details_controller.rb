class Admin::OrderDetailsController < ApplicationController

  def update
    @order_details = Order_detais.find(order_details_params)
    @order_details.update
  end
end
