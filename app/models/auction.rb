class Auction < ActiveRecord::Base
  validates_presence_of :title
  def say_hello
  	return "Hello World!"
  end
end