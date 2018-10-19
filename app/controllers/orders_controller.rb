class OrdersController < ApplicationController
  def new
  end
  def bill
  	@customer=Customer1.find(82)
  	@order=@customer.orders
 end
 def edit
  @order= Order.new
end

 def updateStock
 	render plain: params
 end
 def buy
 	@order=Order.find(params[:id])
 end
 def update
 	render plain: params
 end
end