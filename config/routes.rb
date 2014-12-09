Rails.application.routes.draw do
  resources :users, except: [:new, :edit]
  resources :categories, except: [:new, :edit]
  resources :posts, except: [:new, :edit] do
    resources :categories, except: [:index, :create, :show, :new, :edit]
  end

  post '/login', to: 'users#login'
  get 'logout', to: 'users#logout'
  
end
