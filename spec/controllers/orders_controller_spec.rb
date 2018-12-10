require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
 before :each do
  request.env['devise.mapping'] = Devise.mappings[:customer1]
  @controller = Customer::SessionsController.new
  visit '/customer1s/sign_in'
  fill_in 'customer1_email', with: "tmohan064@gmail.com"
  fill_in "customer1_password", with: "Tmohan064@gmail"
  click_button "Log in"        
end

  describe "BEFORE GET #bill" do
        it "Check the user is signed in" do
        expect(current_path).to eq('/customers')
         # @controller = OrdersController.new
         # visit '/buy'
         # get :buy, params: { cust_id: 18 }
          
         #  # visit '/buy'+"?cust_id=18"
         #  fill_in 'order_cost', with: "tmohan064@gmail.com"
         # expect(current_path).to eq(200)
    end
  end
  describe "AFTER GET #bill" do
        it "Check the user is signed in" do
        
         # @controller = OrdersController.new
         # visit '/buy'
         # get :buy, params: { cust_id: 18 }
          
         #  # visit '/buy'+"?cust_id=18"
         #  fill_in 'order_cost', with: "tmohan064@gmail.com"
         # expect(current_path).to eq(200)
    end
  end
end