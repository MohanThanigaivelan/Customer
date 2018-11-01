Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   
   resources :customers, :orders ,:items
   get "bill",to: "orders#bill"
   patch "bill",to: "orders#updateStock"
   get "buy",to: "orders#buy"
   post "buy",to: "orders#buy"
   post "bill",to: "orders#bill"

   root 'customers#new'
end