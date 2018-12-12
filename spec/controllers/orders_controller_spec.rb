require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  it "When it calls Bill method it should call  bill method" do
    controller=OrdersController.new
    @customer=FactoryBot.create(:customer1)
    sign_in(@customer)
    @item=FactoryBot.create(:item)
    @order = FactoryBot.create(:order)
    @order.customer1_id = @customer.id
    @order.item_id = @item.id
    @order.save
    @order=[@order]
    get :bill
    expect(assigns(:order)).to eq(@order)
  end
  it "When it calls Bill method it should call  buy method" do
    controller=OrdersController.new
    @customer=FactoryBot.create(:customer1)
    sign_in(@customer)
    get :buy, params: { id: @customer.id }
    expect(assigns[:customer].id).to eq(@customer.id)
  end
end