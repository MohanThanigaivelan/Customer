class OrdersController < ApplicationController
  def new
  end
  def bill
  	@customer=Customer1.find(80)
    @item=Item.find(4)
   end
end
