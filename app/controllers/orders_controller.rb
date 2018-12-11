 class OrdersController < ApplicationController
  
  def bill 
  if params[:commit] == "PLACE ORDER"
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
   # else
   #  k=customer_params
   #  @customer=Customer1.where(id: k["cust_id"]).take
  end
    @order=current_customer1.orders
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


if params[:commit] == "BUY ITEMS"
 	k=customer_params
 	@customer=Customer1.where(id: k["cust_id"]).take
  @item=Item.all
  puts "BUY ITEMS"  
else
  @customer = Customer1.find(params[:id])
  @item=Item.all
  # redirect_to '/buy/18'
end
 end
 def update
 	render plain: params
 end
 private
  def customer_params
    params.permit(:cust_id)
  end
  def bill_params
   params.require(:order).permit(:cust_id,:name,:total,:quantity,:stock)
  end
end