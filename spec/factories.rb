FactoryBot.define do
  factory :customer1 do
  	email "mohan@g.com"
  	password "1aA!qwer"
  	phone "1234567890"
  	name "Mohan"
  end
 
  factory :item do
  	serial_no 10
  	name "Oil"
  	cost  123
  	stock 12
  end

  factory :order do
  	quantity 12
    total 10
  end
end
 