class Admin::HomesController < ApplicationController
  def top
    @orders = Order.all
    @posts = @orders.page(params[:page]).per(10) #ページネーション
  end
  
  private
  
  def order_params
    params.require(:order).permit(:name, :created_at, :status, :order_detail_id, :postal_code, :address, :customer_id)
  end  
end
