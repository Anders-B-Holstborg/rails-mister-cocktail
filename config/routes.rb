Rails.application.routes.draw do
  root to: 'cocktails#index'
  resources :cocktails, except: [:index] do
    resources :doses
  end
  resources :ingredients
end
