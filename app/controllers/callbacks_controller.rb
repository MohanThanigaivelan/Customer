class CallbacksController < ApplicationController
def google_oauth2
     raise  request.env["omniauth.auth"].to_yaml
     @customer = Customer1.from_omniauth(request.env["omniauth.auth"])
        sign_in_and_redirect @customer
end
  # Omniauth failure callback
  def failure
  
    flash[:notice] = params[:message]
  end

  # logout - Clear our rack session BUT essentially redirect to the provider
  # to clean up the Devise session from there too !
  def destroy
    session[:user_id] = nil
    flash[:notice] = 'You have successfully signed out!'
    redirect_to "#{CUSTOM_PROVIDER_URL}/users/sign_out"
  end

end
