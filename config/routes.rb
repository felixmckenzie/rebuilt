# frozen_string_literal: true

Rails.application.routes.draw do
  # get 'watches/create'
  # get 'watches/destroy'

  resources :listings
  devise_for :users

  resources :conversations do
    resources :messages, only: %i[index create new]
  end

  put '/messages/:id', to: 'messages#update', as: 'mark_as_read'

  root 'listings#index'
  get '/payments/success', to: 'payments#success'
  post '/payments/webhook', to: 'payments#webhook'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/watches', to: 'watches#index', as: 'watchlist'
  post '/watches', to: 'watches#create', as: 'create_watched_listing'
  delete '/watches/:id', to: 'watches#destroy', as: 'destroy_watch'
end
