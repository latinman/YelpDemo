Rails.application.routes.draw do

  devise_for :users
  get "/about" => "pages#about"
  get "/contact" => "pages#contact"
  resources :restaurants
  resources :reviews
  root "restaurants#index"
end
