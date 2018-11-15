class Api::CustomersController < ApplicationController
	before_action :doorkeeper_authorize! 
	def show
     @customer=Customer1.find(params[:id])
     @order=@customer.orders
     respond_to do |format|
			format.json{render :json => @order.to_json,:status => :ok}
			#format.xml { render :xml => @order.to_xml,:status => :ok } 
	 end
	end
end