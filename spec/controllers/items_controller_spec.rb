require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  it "When it calls index method it should call all items" do
    message=controller.index
    expect(message).to eq(Item.all)
  end
  it "When it calls update method it should update the attributes of particular item" do
    # controller.update
    @customer=FactoryBot.create(:customer1)
    sign_in(@customer)
    params =  {item: {stock: "10"}, id: 1}
    patch :update, params: params 
    # patch :update, params: { id: 1 ,serial_no: 3 ,name: "Potato",cost: 23,stock: 77} 
    expect(assigns(:item).stock).to eq(10)
  end
  it "When it calls destroy method it should delete the specific item and should redirect to items path" do
    # controller.update
    @customer=FactoryBot.create(:customer1)
    sign_in(@customer)
    @item=FactoryBot.create(:item)
    delete :destroy, params: { id: @item.id } 
    expect(assigns(:item)).to eq("")   
  end
  it "When it calls delete method it should delete the specific items" do
    # controller.update
    @customer=FactoryBot.create(:customer1)
    sign_in(@customer)
    delete :destroy,params: { id: 1 } 
    expect(response.status).to eq(302)   
  end
end
