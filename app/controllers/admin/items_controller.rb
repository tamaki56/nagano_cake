class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @genre = @item.genre
  end

  def edit
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_item_path(@item.id)
  end
  
  def update
  end
  
  private
    
  def item_params
    params.require(:item).permit(:name, :introduction, :price, :is_active, :image)
  end

end
