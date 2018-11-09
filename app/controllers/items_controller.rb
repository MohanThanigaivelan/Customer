
class ItemsController < ApplicationController
  before_action :doorkeeper_authorize! 
  def index
    @items = Item.all
  end
  def show
    @item = Item.find(params[:id])
    respond_to do |format|
      format.json { 
        render json: @item
      }
      format.html {
        render :show 
      }
   end
end
  def edit
  @item= Item.find(params[:id])
end
	def new
	end
	 def create
  @item = Item.new(item_params)
  if  @item.save
  render 'new'
  else 
  	@item.destroy
  	render 'new'
  end	
end 
 def update
    @item = Item.find(params[:id])
    if @item.update_attributes(update_params)
       redirect_to :action => 'show', :id => @item
    else
       render 'edit'
    end
  end
  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path
 end
 private
  def item_params
    params.require(:item).permit(:serial_no,:name,:cost,:stock)
  end
  def update_params
    params.require(:item).permit(:stock)
  end
end

