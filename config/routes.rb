Rails.application.routes.draw do
  resources :tests
  resources :projects
  devise_for :users
  get 'index/home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "index#home"
end
