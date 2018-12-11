require 'spec_helper'

RSpec.describe Item, :type => :model do
  it "should have many Orders" do
    t = Item.reflect_on_association(:orders)
    expect(t.macro).to eq(:has_many)
  end
  it "should have many Customers" do
    t = Item.reflect_on_association(:customer1s)
    expect(t.macro).to eq(:has_many)
  end
end