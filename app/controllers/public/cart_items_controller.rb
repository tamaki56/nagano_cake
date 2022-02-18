class Public::CartItemsController < ApplicationController
  def index
    
  end
  
  def update
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
    params.require(:cart_item).permit(:name, :price, :amount)
  end  
end
