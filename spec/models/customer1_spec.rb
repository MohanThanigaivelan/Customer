require 'spec_helper'

RSpec.describe Customer1, :type => :model do
   context "Email can't be blank ," do  
   	context "Password should contain mixture of letters,Numbers,Special Characters," do
   	 context "Name should contain minimum of 5 characters," do    
     it "should require phone of length 10 characters " do 
        expect(Customer1.new(phone: "9944993754", email: "tmohan064@gmail", password: "Tmohan064@gmail",name: "Mohan")).to be_valid
   end
 end
end
end
end