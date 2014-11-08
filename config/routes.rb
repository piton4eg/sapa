Sapa::Application.routes.draw do
  get '/about',     to: 'static_pages#about'
  get '/contacts',  to: 'static_pages#contacts'

  controller :sessions do
    get     'login',  to: :new
    post    'login',  to: :create
    delete  'logout', to: :destroy
  end

  controller :users do
    get   '/signup',  to: :new
    post  '/signup',  to: :create
    get   '/profile', to: :edit
    put   '/profile', to: :update
  end

  resources :galleries
  resources :photos

  root 'static_pages#home'
end
