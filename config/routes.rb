Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root to: "homes#index"
  root 'homes#index'
  get "home/about" => "homes#about"
  resources :users do
   resource :relationships, only: [:create, :destroy]
   get 'follows'=>'relationships#follower',as:'follows'
   get 'followers'=>'relationships#followed',as:'followers'
  end
  resources :books do
	  resources :book_comments, only: [:create, :destroy]
	  resource :favorites, only: [:create, :destroy]
	end
end
