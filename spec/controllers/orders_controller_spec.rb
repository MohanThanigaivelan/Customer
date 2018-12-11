require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  it "When it calls Bill method it should call all bill method" do
    controller=OrdersController.new
    @customer=Customer1.find(18)
    sign_in(@customer)
    get :bill
    expect(response.status).to eq(200)
  end
  it "When it calls Bill method it should call all buy method" do
    controller=OrdersController.new
    @customer=Customer1.find(18)
    sign_in(@customer)
    get :buy, params: { id: 18 }
    expect(response.status).to eq(200)
  end
end