require 'rails_helper'
RSpec.describe Order, :type => :model do
 	it "Orders Should belong to Items" do 
 	  assc = described_class.reflect_on_association(:items)
      expect(assc.macro).to eq :belongs_to
    end	
    it "Orders Should belong to Customers" do 
 	  assc = described_class.reflect_on_association(:customer1s)
      expect(assc.macro).to eq :belongs_to
    end	
end	