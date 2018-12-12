require 'rails_helper'

RSpec.describe Api::CustomersController, type: :controller do
  describe 'GET #index' do
    let(:token) { double :acceptable? => true }

    before do
      controller.stub(:doorkeeper_token) { token }
    end

    it 'Wnen we call the api show method it should return the JSON api of orders of the customer' do
    @customer=FactoryBot.create(:customer1)
    # @customer=Customer1.find(18)
    sign_in(@customer)
    @item=FactoryBot.create(:item)
    @order = FactoryBot.create(:order)
    @order.customer1_id = @customer.id
    @order.item_id = @item.id
    @order.save
    get :show, :format => :json , params: { id: @customer.id }
    expected=JSON.parse(@order.to_json)
    expected=[expected]
    expect(JSON.parse(@response.body)).to eq(expected)
    end
  end
end
