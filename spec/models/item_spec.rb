require 'spec_helper'

RSpec.describe Item, :type => :model do
  before(:each) do
    @user = User.new
    @user.email = "a valid username"
 end
end