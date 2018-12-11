require 'rails_helper'

RSpec.describe Api::CustomersController, type: :controller do

# 	it "API Testing" do
# 		# @controller=Api::CustomersController.new
# 		# controller.show
#         # byebug
		
# 		customer = FactoryBot.create(:item)
# 		expected_response=[{"customer" => {"name" => "nil" , "email " => "a@g.com"}}]
# 		# response= get('/api/customers/19')
# 		get :show, params: { id: 18 }
# 		except(JSON.parse(response.body)).not_to eq(expected_response)
# end
describe " GET #show" do
	  before :each do
	  	request.env['devise.mapping'] = Devise.mappings[:customer1]
  		@controller = Customer::SessionsController.new
  		visit '/customer1s/sign_in'
  		fill_in 'customer1_email', with: "tmohan064@gmail.com"
  		fill_in "customer1_password", with: "Tmohan064@gmail"
 		 click_button "Log in"   
	  end
	  it "return http success" do
	  	@controller=Api::CustomersController.new   
	  	# # visit '/api/customers/18'  
	  	get :show, params: { id: 18 },format: :json
	  	

	  	# @controller.show 
	  	expect(response).to eq("As")
	  end
end
end