Rails.application.routes.draw do
  devise_for :users
  root 'prototypes#index'
  resources :prototypes do
  resources :comments, only: [:create, :edit, :update, :destroy]
  end
  resources :users, only: [:show, :edit, :update]
  resources :tags, only: [:index, :show, :create, :update, :destroy]
  post '/like/:prototype_id' => 'likes#like', as: 'like'
  delete '/like/:prototype_id' => 'likes#unlike', as: 'unlike'
end
