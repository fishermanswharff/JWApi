Rails.application.routes.draw do
  resources :users, except: [:new, :edit]
  resources :posts, except: [:new, :edit]
  resources :categories, except: [:new, :edit]
end
