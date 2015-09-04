Rails.application.routes.draw do

  devise_for :users
  get "/about" => "pages#about"
  get "/contact" => "pages#contact"
  resources :restaurants do
    resources :reviews, except: [:index, :show]
  end
  root "restaurants#index"
end
