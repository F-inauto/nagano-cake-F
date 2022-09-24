class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def index
    @orders = current_customer.orders.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def complete
  end

  def confirm
      @order = Order.new(order_params)
# new 画面から渡ってきたデータを @order に入れます
  if params[:order][:address_number] == "1"
# view で定義している address_number が"1"だったときにこの処理を実行します
# form_with で @order で送っているので、order に紐付いた address_number となります。以下同様です
# この辺の紐付けは勉強不足なので gem の pry-byebug を使って確認しながら行いました
    @order.name = current_customer.last_name# @order の各カラムに必要なものを入れます
    @order.address = current_customer.address
    @order.post_number = current_customer.post_number
  elsif params[:order][:address_number] == "2"
# view で定義している address_number が"2"だったときにこの処理を実行します
    if Address.exists?(params[:order][:address_id])
# registered は viwe で定義しています
      @order.name = Address.find(params[:order][:address_id]).name
      @order.address = Address.find(params[:order][:address_id]).address
      @order.post_number = Address.find(params[:order][:address_id]).post_number
    else
      render :new
# 既存のデータを使っていますのでありえないですが、万が一データが足りない場合は new を render します
    end
  elsif params[:order][:address_number] == "3"
# view で定義している address_number が"3"だったときにこの処理を実行します
    address_new = current_customer.addresses.new(address_params)
    if address_new.save # 確定前(確認画面)で save してしまうことになりますが、私の知識の限界でした
    else
      render :new
# ここに渡ってくるデータはユーザーで新規追加してもらうので、入力不足の場合は new に戻します
    end
  else
    redirect_to order_order_confirm_path(current_customer) # ありえないですが、万が一当てはまらないデータが渡ってきた場合の処理です
  end
  @cart_items = current_customer.cart_items.all # カートアイテムの情報をユーザーに確認してもらうために使用します
  @sum = 0
# 合計金額を出す処理です sum_price はモデルで定義したメソッドです
  end

 # 購入を確定します
def create # Order に情報を保存します
  cart_items = current_customer.cart_items.all
# ログインユーザーのカートアイテムをすべて取り出して cart_items に入れます
  @order = current_customer.orders.new(order_params)
# 渡ってきた値を @order に入れます
  if @order.save
# ここに至るまでの間にチェックは済ませていますが、念の為IF文で分岐させています
    cart_items.each do |cart_item|
# 取り出したカートアイテムの数繰り返します
# order_item にも一緒にデータを保存する必要があるのでここで保存します
      order = Order.new
      order.customer_id = cart_item.customer_id
      order.customer_id = @order.id
      order.total_payment = cart_item.quantity
# 購入が完了したらカート情報は削除するのでこちらに保存します
      order.total_payment = cart_item.quantity
# カート情報を削除するので item との紐付けが切れる前に保存します
      order.save
    end
    redirect_to order_orders_complete_path(current_customer)
    cart_items.destroy_all
# ユーザーに関連するカートのデータ(購入したデータ)をすべて削除します(カートを空にする)
  else
    @order = Order.new(order_params)
    render :new
  end
end

  private

  def order_params
    params.require(:order).permit(:payment_method, :post_number, :address, :name, :item_id)
  end

  def address_params
    params.require(:order).permit(:name, :address,:post_number)
  end
end
