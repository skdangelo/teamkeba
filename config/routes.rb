Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  resource :dashboard, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#index'

  get 'aboutus', to: 'static_pages#aboutus'
  get 'calendar', to: 'static_pages#calendar'
  get 'paperwork', to: 'static_pages#paperwork'
  get 'news', to: 'static_pages#news'
  get 'gallery', to: 'static_pages#gallery'
  resources :programs, only: [:index, :show] do
    resources :enrollments, only: :create
  end

  resources :programs, only: [:index, :show]
  
  namespace :coach do
    resources :programs
  end

  resources :contacts

  get '/redirect', to: 'calendar#redirect', as: 'redirect'
  get '/callback', to: 'calendar#callback', as: 'callback'  
  get '/calendars', to: 'calendar#calendars', as: 'calendars'
  get '/events/:calendar_id', to: 'calendar#events', as: 'events', calendar_id: /[^\/]+/
  post '/events/:calendar_id', to: 'calendar#new_event', as: 'new_event', calendar_id: /[^\/]+/
end
