class Item < ApplicationRecord
	has_many :orders, dependent: :delete_all
	has_many :customer1s, through: :orders
	define_model_callbacks :remove, :only => [:before, :after]
	before_update :UpdateStock
	def UpdateStock
		self.stock= self.stock  + self.stock_was
	end
end
