Rails.application.routes.draw do
  get 'products/index'
  resources :products, only: :index
end
