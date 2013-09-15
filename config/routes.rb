Sapa::Application.routes.draw do
  get "admin" => 'admin#index'

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  resources :users, except: [:show]
  resources :galleries
  resources :photos
  root to: 'galleries#index'

end
