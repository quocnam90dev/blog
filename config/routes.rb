Rails.application.routes.draw do
  root "home#index"

  get 'page/:slug',
      to: 'pages#show',
      slug: /[-a-z0-9+]*/,
      as: :page

  get '/search', to: 'search#index'
end
