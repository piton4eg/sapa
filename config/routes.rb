Sapa::Application.routes.draw do
  match '/about',     to: 'static_pages#about',     via: 'get'
  match '/portfolio', to: 'static_pages#portfolio', via: 'get'
  match '/contact',   to: 'static_pages#contact',   via: 'get'

  controller :sessions do
    get     'login'   => :new
    post    'login'   => :create
    delete  'logout'  => :destroy
  end

  resources :users, only: [:new, :create]
  match '/profile', to: 'users#edit',   via: 'get'
  match '/profile', to: 'users#update', via: 'patch'

  resources :galleries
  resources :photos

  root 'static_pages#home'
end
