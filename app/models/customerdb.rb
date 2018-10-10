class Customerdb < ApplicationRecord
	 validates :phone, presence: true,
                    length: { minimum: 10 }
end
