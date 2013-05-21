Fountain::Application.routes.draw do
  
match "/auth/failure" => redirect("/")
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  #devise_for :users
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users do
    resources :photos
  end
end