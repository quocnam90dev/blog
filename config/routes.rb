Rails.application.routes.draw do
  get 'pages/show'
  root "home#index"

  get 'page/:slug',
      to: 'pages#show',
      slug: /[-a-z0-9+]*/,
      as: :page
end
