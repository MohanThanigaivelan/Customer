Rails.application.routes.draw do
    # get 'customer1s/auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  
  use_doorkeeper
  devise_for :customer1s,:controllers => { :omniauth_callbacks => "customer/omniauth_callbacks",registrations: 'customer/registrations' ,sessions: 'customer/sessions' ,passwords: 'customer/passwords'}  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   resources :customers, :orders ,:items,:contacts
   namespace :api  do
    resources :customers, defaults: {format: :json}

  end

   get "bill",to: "orders#bill"
   get "first",to: "customers#first"
   patch "bill",to: "orders#updateStock"
   # get "buy",to: "orders#buy"
   # post "buy",to: "orders#buy"
   match "/buy/:id" => "orders#buy", :via => [:get], :as => "buy"
   post "bill",to: "orders#bill"
   get "deletedcustomer",to: "customers#deletedcustomer"
   root 'customers#first'

end