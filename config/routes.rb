Rails.application.routes.draw do
  devise_for :users
  root 'prototypes#index'
  resources :prototypes do
  resources :comments, only: [:create, :edit, :update, :destroy]
  end
  resources :users, only: [:show, :edit, :update]
  resources :tags, only: [:index, :show, :create, :update, :destroy]
  post '/like/:tweet_id' => 'likes#like', as: 'like'
  delete '/like/:tweet_id' => 'likes#unlike', as: 'unlike'
end
