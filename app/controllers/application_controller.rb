class ApplicationController < ActionController::Base
before_action :authenticate_customer1!
	private

  # Doorkeeper methods
  def current_resource_owner
    current_resource_owner.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end
   def doorkeeper_unauthorized_render_options(error: nil)
    { json: { error: "YOU ARE NOT AUTHORISED TO THIS PAGE" } }
  end

def sign_in_and_redirect(resource_or_scope, *args)
        options  = args.extract_options!
        scope    = Devise::Mapping.find_scope!(resource_or_scope)
        resource = args.last || resource_or_scope
        sign_in(scope, resource, options)
        redirect_to '/customers'
      end
end
