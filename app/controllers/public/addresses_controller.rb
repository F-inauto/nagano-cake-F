class Public::AddressesController < ApplicationController
  def index
    @address = Address.new
    @addresses = Address.all
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    @address = Address.new(address_params)
  end

  def update
  end

  def destroy
  end

  private

  def address_params
    params.require(:address).permit(:post_code, :address, :name)
  end


end