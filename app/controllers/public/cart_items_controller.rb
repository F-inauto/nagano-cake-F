class Public::CartItemsController < ApplicationController

  before_action :authenticate_customer!

 def create
    @cart_item = current_customer.cart_items.new(cart_item_params)
  end

  def index
    @cart_items = current_customer.cart_items.all
  end

  private

  def cart_item_params
      params.require(:cart_item).permit(:item_id, :quantity)
  end
end