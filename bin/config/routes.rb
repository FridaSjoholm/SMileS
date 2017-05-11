Rails.application.routes.draw do
  resources :texts
  root 'texts#index'

end
