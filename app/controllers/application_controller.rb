class ApplicationController < ActionController::Base
	private

  # Doorkeeper methods
  def current_resource_owner
    current_resource_owner.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end
   def doorkeeper_unauthorized_render_options(error: nil)
    { json: { error: "YOU ARE NOT AUTHORISED TO THIS PAGE" } }
  end
end
