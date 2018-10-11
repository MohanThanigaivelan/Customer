class Customer1 < ApplicationRecord
  has_attached_file :photo, :styles => { :small=> "300x300>" }
  
  validates :phone, presence: true,
                   length: { is: 10}

  
  validates_attachment_file_name :photo, :matches => [/png\Z/]
  validates :name, length: { minimum: 5 }
end
