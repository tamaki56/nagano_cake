class Public::CartItemsController < ApplicationController
  def index
    @cart_items = Cart_item.all
    @item = Item.find(params[:id])
  end
  
  def update
    @cart_item = Cart_item.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path(@cart_item.id)    
  end
  
  def create
  end
  
  def destroy
    
  end
  
  def destroy_all
    @cart_item = Cart_item.find(params[:id])
    @cart_item.destroy.all
    redirect_to cart_items_path
  end
  
  private
    
  def cart_item_params
    params.require(:cart_item).permit(:name, :price, :amount, :item_id)
  end  
end
