Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  root to: "home#index"
  get '/suggestion', to: 'home#suggestion'
  resources :posts do 
  	resources :comments
  	resources :likes
  end

  resources :relationships, only: [:create, :destroy]
  resources :users, only: [:show] do
  	member do
  		get :following, :followers
      post :follow, :unfollow
  	end
  end
 notify_to :users
       # (with devise) notify_to :users, with_devise: :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
