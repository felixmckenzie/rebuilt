Rails.application.routes.draw do
  # get 'watches/create'
  # get 'watches/destroy'

  resources :watches 
  resources :listings
  devise_for :users
  
root "listings#index" 
get "/payments/success", to: "payments#success"
post "/payments/webhook", to: "payments#webhook"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
get "/watches", to: "watches#index", as: "watchlist"
post "/watches", to: "watches#create", as: "create_watched_listing"

end


