require 'rails_helper'
RSpec.describe CustomersController, type: :controller do
  it "When it calls Index method it should return the details of the customer" do
    @customer=FactoryBot.create(:customer1)
    # @customer=Customer1.find(18)
    sign_in(@customer)
    response=get :index
    @item=FactoryBot.create(:item)
    @order = FactoryBot.create(:order)
    @order.customer1_id = @customer.id
    @order.item_id = @item.id
    @order.save
    @order=[@order]
    expect(assigns(:order)).to eq(@order)
  end
  it "When it calls Index method it should return the show the details of the customer" do
    @customer=FactoryBot.create(:customer1)
    sign_in(@customer)
    get :show, params: { id: @customer.id } 
    expect(assigns(:customer)).to eq(@customer)
  end
  it "When it calls Destroy method it should update the delete field in customer as false and redirect to sign_in page" do
   
    @customer=FactoryBot.create(:customer1)
    sign_in(@customer)
    get :destroy , params: { id: @customer.id }
    expect(assigns[:customer].deleted).to eq(true)
  end
   it "When it calls Update method it should update the attributes of the  customer " do
     @customer=FactoryBot.create(:customer1)
     sign_in(@customer)
     @customer.name="Nishanth"
     params = {customer1: {name: @customer.name }, id: @customer.id}
     patch :update , params: params
   # patch :update ,id: 18
    expect(assigns[:customer].name).to eq("Nishanth")
  end
end