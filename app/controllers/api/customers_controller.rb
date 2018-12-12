class Api::CustomersController < ApplicationController
	    before_action :doorkeeper_authorize! 
	
  def show 
     @customer=Customer1.find(params[:id])
     @order=@customer.orders 
     order_xml = JSON.parse(@order.to_json).to_xml(:root => :order)
    respond_to do |format|

          format.json{render :json => @order.to_json,:status => :ok}
      	 format.xml { render xml: order_xml  ,:status => :ok }
         format.html { render 'orders/bill'  }
	 end
	end
end