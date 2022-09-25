class Admin::OrderDetailsController < ApplicationController

  before_action :authenticate_admin!

  def update
    @order_details = OrderDetais.find(params[:id])
    @order = @order_detail.order
    @order_details.update(order_detail_params)



  end
end
