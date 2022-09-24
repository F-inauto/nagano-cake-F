class Admin::OrderDitailsController < ApplicationController
  
  def index
    @order_ditails = Order_ditails.all
    
  end

  def new
  end
  
  def created
  end  
  
  def update
  end
end
