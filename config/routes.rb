Rails.application.routes.draw do
  devise_for :users
  root to: 'cocktails#index'
  resources :cocktails, except: [:index] do
    resources :doses
  end
  resources :ingredients
end
