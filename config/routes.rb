Rails.application.routes.draw do
  resources :registered_applications
  devise_for :users
  root 'welcome#index'

  namespace :api, defaults: { format: :json } do
    match '/events', to: 'events#preflight', via: [:options]
    resources :events, only: [:create]
end
