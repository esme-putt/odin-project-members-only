Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :posts, only: [:new, :create, :index, :show]

  # Defines the root path route ("/")
  root "posts#new"
end
