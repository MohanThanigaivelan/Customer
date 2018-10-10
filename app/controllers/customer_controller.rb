class CustomerController < ApplicationController
  def show
    @customer = Customerdb.find(params[:id])
  end
  def new
  end
  def create
   @customer = Customerdb.new(customer_params )
   if @customer.save
      redirect_to @customer 	
   else
      render 'new'
   end
  end
private
  def customer_params
    params.require(:customer).permit(:name, :dob, :address , :phone)
  end
end
