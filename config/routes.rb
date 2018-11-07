Rails.application.routes.draw do
  
  devise_for :customer1s,:controllers => { registrations: 'customer/registrations' ,sessions: 'customer/sessions' ,passwords: 'customer/passwords'}  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   resources :customers, :orders ,:items
   get "bill",to: "orders#bill"
   get "first",to: "customers#first"
   patch "bill",to: "orders#updateStock"
   get "buy",to: "orders#buy"
   post "buy",to: "orders#buy"
   post "bill",to: "orders#bill"

   root 'customers#first'
end