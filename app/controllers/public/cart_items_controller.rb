class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items
    @total_price = @cart_items.sum{|cart_item|cart_item.item.with_tax_price * cart_item.amount}#合計値
  end
  
  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path(@cart_item.id)    
  end
  
  def create
    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      item.amount += params[:cart_item][:amount].to_i
      item.update(amount: item.amount)
      redirect_to cart_items_path
    else
      @cart_item = CartItem.new(cart_item_params)
      @cart_item.save
      redirect_to cart_items_path    
    end
  end
  
  def destroy
    @cart_item = CartItem.find(params[:id])  
    @cart_item.destroy  
    redirect_to cart_items_path 
  end
  
  def destroy_all
    @cart_item = current_customer.cart_items
    @cart_item.destroy_all
    redirect_to cart_items_path
  end
  
  private
    
  def cart_item_params
    params.require(:cart_item).permit(:name, :price, :amount, :item_id, :customer_id)
  end  
end
