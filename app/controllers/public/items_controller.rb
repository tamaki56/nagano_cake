class Public::ItemsController < ApplicationController
  def index
    @posts = @items.page(params[:page]).per(10)
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
  
  private
    
  def item_params
    params.require(:item).permit(:name, :introduction, :price, :is_active, :image, :genre_id, :amount)
  end  
end
