class Admin::CustomersController < ApplicationController
  def show
  end

  def index
    @posts = Post.all.page(params[:page]).per(10) #ページネーション
  end

  def edit
  end
  
  def update
  end
    
end
