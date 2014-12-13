Rails.application.routes.draw do
  resources :users, except: [:new, :edit]
  resources :categories, except: [:new, :edit]
  resources :images, only: [:index]
  resources :posts, except: [:new, :edit] do
    resources :categories, except: [:index, :create, :show, :new, :edit]
    resources :images, only: [:create, :update]
  end

  post '/login', to: 'users#login'
  get 'logout', to: 'users#logout'
  get 'amazon/sign_key'
end
