Rails.application.routes.draw do
  resources :reviews
  resources :leases
  resources :landlords
  resources :renters
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get '/', to: 'homepages#home', as: 'homepages'
  root "homepages#home", as: 'homepages'

  get '/renter_login', to: "renters#login", as: 'renter_login'
  post '/send_renter_login', to: 'renters#handle_login'

  get '/landlord_login', to: "landlords#login", as: 'landlord_login'
  post '/send_landlord_login', to: 'landlords#handle_login'
end
