Rails.application.routes.draw do
  devise_for :users , controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :posts, only: [:create, :edit, :update, :index]

  resources :comments, only: [:create]
   get "likes/toggle", as: "like_toggle"
  get "users/my_profile"
  patch "users/update" =>"users#update", as: "user"
  delete "posts/:id" => "posts#destroy", as: "post_destroy"
  delete "comments/:id" => "comments#destroy", as:"comment_destroy"

  root "posts#index"
  
end
