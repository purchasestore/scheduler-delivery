Rails.application.routes.draw do
  resources :availabilities
  resources :meetings
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'scheduler/show', to: 'scheduler#show', as: 'show'
  get 'calendar', to: 'availabilities#calendar', as: 'calendar'
  get 'admin', to: 'scheduler#admin', as: 'admin'
  root to: 'availabilities#calendar'
end