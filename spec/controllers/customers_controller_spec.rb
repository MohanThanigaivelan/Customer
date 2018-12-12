require 'rails_helper'

RSpec.describe CustomersController, type: :controller do
  it "When it calls Index method it should return the details of the customer" do
    controller=CustomersController.new
    @customer=FactoryBot.create(:customer1)
    sign_in(@customer)
    get :index
    expect(response.status).to eq(200)
  end
  it "When it calls Index method it should return the show the details of the customer" do
    controller=CustomersController.new
    @customer=FactoryBot.create(:customer1)
    sign_in(@customer)
    get :show, params: { id: @customer.id } 
    expect(response.status).to eq(200)
  end
  it "When it calls Destroy method it should update the delete field in customer as false and redirect to sign_in page" do
    controller=CustomersController.new
     @customer=FactoryBot.create(:customer1)
      sign_in(@customer)

    get :destroy , params: { id: @customer.id }
    expect(response.status).to eq(302)
  end
   it "When it calls Update method it should update the attributes of the  customer " do
    controller=CustomersController.new
    # @customer=Customer1.find(18)
   # patch :update  , params: {customer1:  {name: 'Mohan',dob: '29/09/1997' ,photo: "h.png",address: "Coimbatore",phone: 9944993754,email: "tmohan064@gmail.com"} }
     
     @customer=FactoryBot.create(:customer1)
      sign_in(@customer)

     params = {customer1: {name: @customer.name , dob: @customer.dob ,address: @customer.dob,phone: @customer.phone,email: @customer.email}, id: @customer.id}
     patch :update , params: params
   # patch :update ,id: 18
    expect(response.status).to eq(200)
  end
end