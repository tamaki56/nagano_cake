class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end
  
  def confirm
    @cart_items = CartItem.all
    select_address = params[:order][:select_address]
    @order = Order.new(order_params)
    @order.shipping_cost = 800
    @sum = []
    @cart_items.each do |cart_item|
      cart_item.item.name 
      cart_item.item.with_tax_price
      cart_item.amount
      sum = cart_item.item.with_tax_price * cart_item.amount
      @sum << sum 
    end
    @order.total_payment =  @order.shipping_cost + @sum.sum
    @order.customer_id = current_customer.id
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
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    redirect_to orders_thanks_path        
  end  

  def thanks
  end

  def index
    @orders = Order.all
  end

  def show
  end
  
  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :shipping_cost, :customer_id, :total_payment)
  end
end
