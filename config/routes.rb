Rails.application.routes.draw do
  devise_for :users
  resources :availabilities
  resources :meetings
  post '/meetings/:id/toggle', to: 'meetings#toggle', as: 'toggle'
  post '/schedulers/:id/toggle_scheduler', to: 'schedulers#toggle_scheduler', as: 'toggle_scheduler'
  get '/meetings/:id/duplicate', to: 'meetings#duplicate', as: 'meeting_duplicate'

  get 'schedulers/show', to: 'schedulers#show', as: 'show'
  get 'schedulers/show-delivers', to: 'schedulers#show_delivers', as: 'show_delivers'
  get 'schedulers/clients-delivers', to: 'schedulers#clients_delivers', as: 'clients_delivers'
  get 'calendar', to: 'availabilities#calendar', as: 'calendar'
  root to: 'schedulers#show'
end