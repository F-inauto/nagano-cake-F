class Public::CustomersController < ApplicationController
  def show
  end

  def edit
  end

  def unsubscribe
  end

  private

  def customer_params
    params.require(:customer).ppermit(:email, :password, :last_name, :first_name, :last_name_kana, :first_name_kana, :post_number, :address, :phone_number)
  end
end
