Rails.application.routes.draw do
  resources :quotes
  root 'quotes#index'
  # get 'quotes/index'

  # get 'quotes/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
