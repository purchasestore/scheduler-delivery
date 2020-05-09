Rails.application.routes.draw do
  devise_for :users
  resources :availabilities
  resources :meetings
  post '/meetings/:id/toggle', to: 'meetings#toggle', as: 'toogle'

  get 'scheduler/show', to: 'scheduler#show', as: 'show'
  get 'scheduler/show-delivers', to: 'scheduler#show_delivers', as: 'show_delivers'
  get 'scheduler/clients-delivers', to: 'scheduler#clients_delivers', as: 'clients_delivers'
  get 'calendar', to: 'availabilities#calendar', as: 'calendar'
  root to: 'scheduler#show'
end