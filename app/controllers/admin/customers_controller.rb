class Admin::CustomersController < ApplicationController
  def show
  end

  def index
    @customers = Customer.
    @posts = @customers.page(params[:page]).per(10) #ページネーション
  end

  def edit
  end
  
  def update
  end
    
end
