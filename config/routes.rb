Rails.application.routes.draw do
  # get 'splash/index'
  devise_for :users, controllers: { registrations: "registrations" }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :category 
  resources :transaction
  
  # Defines the root path route ("/")

  unauthenticated :user do
    root to: 'splash#index'
  end
  authenticated :user do
    root "category#index", as: :authenticated_root
  end
end
