# frozen_string_literal: true

class Customer::PasswordsController < Devise::PasswordsController
  # GET /resource/password/new
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
   @customer = Customer1.find_by(reset_password_token: "d59261cbcf504320d9278a9625716cacbf9bb9e17cd13b5f405d35bff09a73c9")
   puts @customer
  end

 protected

  def after_resetting_password_path_for(resource)
    root_path
  end

  # The path used after sending reset password instructions
  def after_sending_reset_password_instructions_path_for(resource_name)
    super
  end
end
