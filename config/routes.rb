Rails.application.routes.draw do

  get "/about" => "pages#about"
  get "/contact" => "pages#contact"
  resources :restaurants
  root "restaurants#index"
end
