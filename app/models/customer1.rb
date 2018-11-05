class Customer1 < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :orders, dependent: :delete_all
  has_many :items , through: :orders
  has_attached_file :photo, :styles => { :small=> "300x300>" }
  
  validates :phone, presence: true,
                   length: { is: 10}

  
 validates_attachment_file_name :photo, :matches => [/png\Z/]
  validates :name, length: { minimum: 5 }
  validates :password, :format => {:with => /^(?=.*[a-zA-Z])(?=.*[0-9]).{7,}$/, message: "must be at least 7 characters and include one number and one letter."}
end
