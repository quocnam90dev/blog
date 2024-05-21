Rails.application.routes.draw do
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
end
