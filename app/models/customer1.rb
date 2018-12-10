class Customer1 < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:omniauthable ,omniauth_providers: [:google_oauth2]
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
    
    # validates_attachment_file_name :photo, :matches => [/png\Z/]
    validates :name, length: { minimum: 5 }
    validates :password, :format => {:with => /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[0-9])(?=.*[^a-zA-Z0-9]).{8,}$/, message: "must be at least 7 characters and include one number and one letter and one special character.",:multiline => true} 
 
  def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
      end
  end
  
  


def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    user = Customer1.where(:provider => access_token.provider, :uid => access_token.uid ).first
    if user
      return user
    else
      registered_user = Customer1.where(:email => access_token.info.email).first
      if registered_user
        return registered_user
      else
        user = Customer1.create(name: data["name"],
          provider:access_token.provider,
          email: data["email"],
          uid: access_token.uid ,
          password: Devise.friendly_token[0,20],
        )
      end
   end
end 
end
