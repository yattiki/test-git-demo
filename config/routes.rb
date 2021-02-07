Rails.application.routes.draw do
 root 'tweets#index'
 
 resources :tweets, only: [:index, :show, :new, :create, :edit, :update, :destroy]
 # post 'tweets/create', to: 'tweets#create'
 # post 'tweets/:id/destroy', to: 'tweets#destroy'
end