Sapa::Application.routes.draw do
  get '/about',     to: 'static_pages#about'
  get '/contacts',  to: 'static_pages#contacts'
  get '/blog',      to: 'static_pages#blog'

  controller :sessions do
    get     '/login',  action: :new
    post    '/login',  action: :create
    delete  '/logout', action: :destroy
  end

  controller :users do
    get   '/signup',  action: :new
    post  '/signup',  action: :create
    get   '/profile', action: :edit
    put   '/profile', action: :update
  end

  resources :galleries, except: :show do
    resources :photos, only: :create do
      delete 'destroy', as: 'destroy', on: :collection
    end
  end

  root 'static_pages#home'
end
