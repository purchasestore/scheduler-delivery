Rails.application.routes.draw do
  devise_for :users
  resources :availabilities
  resources :meetings
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'scheduler/show', to: 'scheduler#show', as: 'show'
  get 'scheduler/show-delivers', to: 'scheduler#show_delivers', as: 'show_delivers'
  get 'calendar', to: 'availabilities#calendar', as: 'calendar'
  get 'admin', to: 'scheduler#admin', as: 'admin'
  root to: 'availabilities#calendar'
end