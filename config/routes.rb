# == Route Map
#

Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  get 'images/show'
  root "home#index"

  get 'page/:slug',
      to: 'pages#show',
      slug: /[-a-z0-9+]*/,
      as: :page

  get '/search', to: 'search#index'
  get '/search/:year/:month',
      to: 'search#index',
      year: /\d{4}/,
      month: /\d{2}/

  get 'tags/:name', to: 'tags#show', name: /[-a-z0-9_+]*/, as: :tag

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  resources :images, only: :show

end
