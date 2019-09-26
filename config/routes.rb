Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#index'
  get 'aboutus', to: 'static_pages#aboutus'
  get 'contactus', to: 'static_pages#contactus'
  get 'calendar', to: 'static_pages#calendar'
  get 'paperwork', to: 'static_pages#paperwork'

  resources :programs, only: [:index, :show]
  namespace :coach do
    resources :programs, only: [:new, :create, :show]
  end

  get '/redirect', to: 'calendars#redirect', as: 'redirect'
  get '/callback', to: 'calendars#callback', as: 'callback'  
  get '/calendars', to: 'calendars#calendars', as: 'calendars'
  get '/events/:calendar_id', to: 'calendar#events', as: 'events', calendar_id: /[^\/]+/
  post '/events/:calendar_id', to: 'calendar#new_event', as: 'new_event', calendar_id: /[^\/]+/
end
