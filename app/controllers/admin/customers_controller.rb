class Admin::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end

  def index
    @customers = Customer.all
    @posts = @customers.page(params[:page]).per(10) #ページネーション
  end

  def edit
    @customer = Customer.find(params[:id])
  end
  
  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to admin_customer_path(@customer.id)
  end
  
  private
    
  def customer_params
    params.require(:customer).permit(:last_name, :first_name,:first_name_kana, :last_name_kana, :is_active, :email, :postal_code, :address, :telephone_number)
  end    
  
end
