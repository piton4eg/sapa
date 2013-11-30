Sapa::Application.routes.draw do
  match '/about', to: 'static_pages#about', via: 'get'
  match '/portfolio', to: 'static_pages#portfolio', via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'

  get "admin" => 'admin#index'

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  resources :users, except: [:show]
  resources :galleries
  resources :photos

  root 'static_pages#home'
end
