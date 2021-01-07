Rails.application.routes.draw do

  get '/renter_login', to: "renters#login", as: 'renter_login'
  post '/send_renter_login', to: 'renters#handle_login'
  delete '/renters/logout', to: 'renters#logout', as: 'logout'
  
  resources :reviews
  resources :leases
  resources :landlords
  resources :renters
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get '/', to: 'homepages#home', as: 'homepages'
  root "homepages#home", as: 'homepages'
  


  
 

  
  

 
end
