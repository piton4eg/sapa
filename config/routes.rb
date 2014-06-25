Sapa::Application.routes.draw do
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'

  controller :sessions do
    get     'login'   => :new
    post    'login'   => :create
    delete  'logout'  => :destroy
  end

  resources :users, only: %i(new create)
  get '/profile', to: 'users#edit'
  put '/profile', to: 'users#update'

  resources :galleries
  resources :photos

  root 'static_pages#home'
end
