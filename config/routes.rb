Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :category 
  resources :transaction
  # Defines the root path route ("/")
  root to: "category#index"
end
