class CustomersController < ApplicationController
  def index
    @customer = Customer1.all
  end
  def show
    @customer = Customer1.find(params[:id])
  end
 def new	
 	@customer = Customer1.new
 end 
 def edit
  @customer= Customer1.find(params[:id])
end

 def create
  @customer = Customer1.new(customer_params)
  if  @customer.save
  render 'customers/show'
  else 
  	@customer.destroy
  	render 'new'
  end	
end
 def update
    @customer = Customer1.find(params[:id])
 
    if @customer.update(customer_params)
       render plain: params[:article].inspect
    else
       render plain: params[:article].inspect
    end
  end
 
 def destroy
  @customer = Customer1.find(params[:id])
  @customer.destroy
  redirect_to customers_path
 end
private
  def customer_params
    params.require(:customer).permit(:name,:dob,:photo,:address,:phone)
  end
end
