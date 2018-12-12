require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  it "When it calls Bill method it should call all bill method" do
    controller=OrdersController.new
    @customer=FactoryBot.create(:customer1)
    sign_in(@customer)
    get :bill
    expect(response.status).to eq(200)
  end
  it "When it calls Bill method it should call all buy method" do
    controller=OrdersController.new
    @customer=FactoryBot.create(:customer1)
    sign_in(@customer)
    get :buy, params: { id: @customer.id }
    expect(response.status).to eq(200)
  end
end