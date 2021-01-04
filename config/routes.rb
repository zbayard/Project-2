Rails.application.routes.draw do
  resources :reviews
  resources :leases
  resources :landlords
  resources :renters
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/homepages', to: 'homepages#home', as: 'homepages'

end
