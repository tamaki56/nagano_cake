class Public::OrdersController < ApplicationController
  def new
    if current_customer.cart_items.blank?
      redirect_to cart_items_path
    else
      @order = Order.new
    end
  end
  
  def confirm
    @cart_items = current_customer.cart_items
    select_address = params[:order][:select_address]
    @order = Order.new(order_params)
    @order.shipping_cost = 800
    #sumの定義
    @total = @cart_items.sum{|cart_item|cart_item.item.with_tax_price * cart_item.amount}
    @order.total_payment =  @order.shipping_cost + @total
    @order.customer_id = current_customer.id
    #select_addressの条件分岐
    if select_address == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    elsif select_address == "1"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    end
  end  
  
  def create
    #オーダモデルのデータ登録
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    # order_detailモデルデータ登録
    @cart_items = current_customer.cart_items    
    @cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.item_id = cart_item.item_id
      @order_detail.order_id = @order.id
      @order_detail.amount = cart_item.amount
      @order_detail.price = cart_item.item.with_tax_price
      @order_detail.save
    end
    #カート内商品全削除
    @cart_items.destroy_all    
    redirect_to orders_thanks_path        
  end  

  def thanks
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @sum = []
  end
  
  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :shipping_cost, :customer_id, :total_payment,)
  end
end
