Fountain::Application.routes.draw do
  #resources :users do
   # resources :photos
  #end

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  #devise_for :users
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users
  
end