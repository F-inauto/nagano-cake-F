class Order < ApplicationRecord

  has_many :order_details
  has_many :customer_orders, dependent: :destroy
  belongs_to :customer

  #支払い方法用のenum
  enum payment_method: { クレジットカード: 0, 銀行振込: 1 }
  #オーダーステータスのenum
  enum order_status: { wait_payment: 0, confirm_payment: 1, making: 2, preparing_ship: 3, finish_prepare: 4}
end


