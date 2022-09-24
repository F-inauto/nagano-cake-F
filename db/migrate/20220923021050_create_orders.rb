class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :post_number
      t.string :address
      t.string :name
      t.integer :quantity
      t.integer :shipping_cost
      t.integer :total_payment
      # enum用のinteger型のpayment_methodカラムを追加
      t.integer :payment_method, null: false, default: 0
      #enum用のinteger型のorder_statusカラム追加
      t.integer :order_status, null: false, default: 0
      t.timestamps
    end
  end
end
