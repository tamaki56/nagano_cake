class Admin::OrdersController < ApplicationController
  def show
  end
  
  def index
    @orders = Order.all
    @posts = @orders.page(params[:page]).per(10) #ページネーション
  end
  
  def update
  end
  
  
end
