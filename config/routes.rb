Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations"}
  root 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get '/search', to: 'static_pages#search'
  get '/calendar', to: 'static_pages#calendar'
  get '/statistics', to: 'static_pages#statistics'
  resources :search_terms, except: :show
  resources :profiles, except: :show
end
