Rails.application.routes.draw do
  devise_for :users
  root to: 'cocktails#index'
  get '/cocktails', to: redirect('/')
  resources :cocktails, except: [:index] do
    resources :doses, except: %i[index show]
  end
  resources :ingredients
end
