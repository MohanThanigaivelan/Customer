class Order < ApplicationRecord
	belongs_to :customer1s , optional: true
	belongs_to :items , optional: true
	
	before_update  :updateStock
	def updateStock
       self.stock= self.stock+self.stock
	end
end

