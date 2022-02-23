class Admin::OrderDetailsController < ApplicationController
  def update
    #ステータス更新の連動
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)
    if @order_detail.making_status == "production"
      @order = @order_detail.order
      @order.update(status: 2)
    elsif @order_detail.making_status == "production_completed"
        @order = @order_detail.order
        @order.update(status: 3)
    end
      redirect_to admin_order_path(@order.id)
  end 
  
  private
    
  def order_detail_params
    params.require(:order_detail).permit(:order_id, :making_status)
  end  
end
