Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :products do
   resource :favorites, only: [:create, :destroy]
   resources :comments 
  end
  resources :users
  root 'products#index'
end
