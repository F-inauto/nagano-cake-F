class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    @customer.save
    redirect_to customers_mypage_path(current_customer.id)
  end

  def unsubscribe
  end

  private

  def customer_params
    params.require(:customer).ppermit(:email, :last_name, :first_name, :last_name_kana, :first_name_kana, :post_number, :address, :phone_number)
  end
end
