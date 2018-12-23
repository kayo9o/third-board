Rails.application.routes.draw do
  root to: 'thirds#index'
  resources :thirds
end
