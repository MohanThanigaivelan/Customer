class CustomersController < ApplicationController
  def index
    @customer = current_customer1
     @order=current_customer1.orders 
    
    # @customer=Customer1.all
  end
 def deletedcustomer
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
    if @customer.update_attributes(customer_params)
       redirect_to :action => 'show', :id => @customer
    else
       render 'edit'
    end
  end
 
 def destroy
  @customer = Customer1.find(params[:id])
  @customer.update_attribute(:deleted,true)
  reset_session
  redirect_to '/customer1s/sign_in'        
 end
 def first
 end

 private
  def customer_params
    params.require(:customer1).permit(:name,:dob,:photo,:address,:phone,:email)
  end
  def login_params
    params.require(:customer1).permit(:email)
  end
end

