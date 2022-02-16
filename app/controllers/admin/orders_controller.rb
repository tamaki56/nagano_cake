class Admin::OrdersController < ApplicationController
  def show
  end
  
  def index
    @orders = Order.all
    @posts = Post.all.page(params[:page]).per(10) #ページネーション
  end
  
  def update
  end
  
  
end
