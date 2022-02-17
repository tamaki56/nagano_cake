class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
  end
  
  def update
  end
  
  private
    
  def order_params
    params.require(:item).permit(:name, :created_at, :status, :order_detail_id, :postal_code, :address)
  end

end
