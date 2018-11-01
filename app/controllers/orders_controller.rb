 class OrdersController < ApplicationController
  def new
  end
  def bill
    k=bill_params
    @item=Item.where(id: k["name"]).take
    @item.update(stock: k["stock"])
  	puts @item
  	 @order1=Order.new
    @order1.customer1_id=k["cust_id"]
    @order1.item_id=k["name"]
    puts @order1.item_id
    @order1.total=k["total"]
    @order1.quantity=k["quantity"]
    @order1.save
     @customer=Customer1.where(id: k["cust_id"]).take
    @order=@customer.orders
    
 end
 def edit
  @order= Order.new
end

 def updateStock
 	render plain: params
 end
 def buy
 	#@customer=Customer1.find(params[:id])
 	#@order=Order.find(params[:id])
 	k=customer_params
 	@customer=Customer1.where(id: k["cust_id"]).take
  if @customer.name == k["name"]
 	   puts @customer
 	   @item=Item.all
 else
     render 'new'
 end
 end
 def update
 	render plain: params
 end
 private
  def customer_params
    params.require(:customer1).permit(:cust_id,:name)
  end
  def bill_params
    params.require(:order).permit(:cust_id,:name,:total,:quantity,:stock)
  end
end