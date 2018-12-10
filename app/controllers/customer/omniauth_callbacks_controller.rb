# frozen_string_literal: true

class Customer::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
    # devise :omniauthable, omniauth_providers: [:google_oauth2]

  # You should also create an action method in this controller like this:
  # def twitter
  # end
  def google_oauth2
     
     # @customer = Customer1.from_omniauth(request.env["omniauth.auth"])
     #    sign_in_and_redirect @customer
    @customer = Customer1.find_for_google_oauth2(request.env["omniauth.auth"], current_customer1  )
 
    if @customer.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
      sign_in_and_redirect @customer, :event => :authentication
    else
      session["devise.google_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
end
  # Omniauth failure callback
  def failure
  
    flash[:notice] = params[:message]
  end

  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end
