class Order < ApplicationRecord
	belongs_to :customer1s , optional: true
	belongs_to :items , optional: true
	
	
end

