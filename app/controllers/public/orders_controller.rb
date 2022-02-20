class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    
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
  
  def confirm
    @order = Order.new(order_params)
    @address = Address.find(params[:order][:address_id])
    @order.postal_code = @address.postal_code
    @order.address = @address.address
    @order.name = @address.name
  end
  
  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :shipping_cost, :customer_id)
  end
end
