Rails.application.routes.draw do
  get 'password_resets/new'

  get 'password_resets/edit'

  get 'sessions/new'

  root 'static_pages#home'
  get  '/privacy',          to: 'static_pages#privacy'
  get  '/about',            to: 'static_pages#about'
  get  '/contact',          to: 'static_pages#contact'
  get '/admin/orders',      to: 'static_pages#admin_orders'
  get  '/signup',           to: 'users#new'
  post '/signup',           to: 'users#create'
  get '/orders',            to: 'users#orders'
  get '/checkout',          to: 'users#checkout'
  get    '/login',          to: 'sessions#new'
  post   '/login',          to: 'sessions#create'
  delete '/logout',         to: 'sessions#destroy'
  get '/instagram',         to: 'sessions#instagram_auth'
  get '/instagram/callback',to: 'sessions#instagram'
  get '/showpage',          to: 'pages#showpage'
  get '/updatelayout',      to: 'pages#updatelayout'


  # resources :users
  resources :users do
    resources :photos
    resources :albums do
      resources :pages
    end
  end

  post '/add_page', to: 'photos#addpage'
  post '/update_title', to:'albums#updatetitle'

  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
end