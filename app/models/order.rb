class Order < ApplicationRecord

  has_many :order_items

  enum payment_method: { credit_card: 0, transfer: 1 }

  has_many :customer_orders, dependent: :destroy
  belongs_to :customer

  #支払い方法用のenum
  enum payment_method: { クレジットカード: 0, 銀行振込: 1 }
  #オーダーステータスのenum
  enum order_status: { 入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み: 4 }

end
