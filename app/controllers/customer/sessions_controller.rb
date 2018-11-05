# frozen_string_literal: true

class Customer::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
     super
  end

  # POST /resource/sign_in
  def create
    super
  end

  # DELETE /resource/sign_out
  def destroy
     reset_session
     redirect_to '/customer1s/sign_in'
  end

protected

  # If you have extra params to permit, append them to the sanitizer.
  
  
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  end
  def after_sign_out_path_for(resource)
    puts "SIGN OUT"
    super(resource)
  end
end
