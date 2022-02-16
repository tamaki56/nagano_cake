class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @genre = @item.ge
  end

  def edit
  end

  def new
  end
  
  def create
  
    
  end
  
  def update
  
    
  end
  
  private
    
  def item_params
    params.require(:item).permit(:name, :introduction, :price, :is_active)
  end

end
