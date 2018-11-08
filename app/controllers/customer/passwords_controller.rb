# frozen_string_literal: true

class Customer::PasswordsController < Devise::PasswordsController
  # GET /resource/password/new
  after_action :updateDeleted, only:[:update]
  def new
     if params[:message]
        @customer=Customer1.find_by(id: params[:message])
     end
     self.resource=resource_class.new
  end

  # POST /resource/password
  def create
    super
  end

  # GET /resource/password/edit?reset_password_token=abcdef
  def edit
  
     super
  end

  # PUT /resource/password
  def update
       puts params[:customer1][:reset_password_token]
       reset_password_token = Devise.token_generator.digest(self, :reset_password_token, params[:customer1][:reset_password_token])
       @customer=Customer1.find_by(reset_password_token: reset_password_token)

       super

  end
 protected

  def after_resetting_password_path_for(resource)
    root_path
  end

  # The path used after sending reset password instructions
  def after_sending_reset_password_instructions_path_for(resource_name)
    super
  end
  def updateDeleted
    @customer.update_attribute(:deleted,false)
    puts @customer.deleted
  end 
end
