class Admin::OrderDetailsController < ApplicationController

  def update
    @order_details = OrderDetais.find(params[:id])
    if @order_details.update(order_details_params) &&  @order_details.making_status == "making"
      #製作ステータス製作中→製作中
      @order_details.order.update_all(order_status: 2)
      redirect_to admin_order_path(@order_details.id)
    elsif @order_details.update(order_details_params) && @order_details.making_status == "complete"
      @order_details.order.update_all(order_status: 3)
      redirect_to admin_order_path(@order_details.id)
    else
      render 'index'
    end
  end


  private
    def order_details_params
      params.require(:order_detail).permit(:order_id, :item_id, :price, :quantity, :making_status)
    end

end