Rails.application.routes.draw do
  devise_for :users
  resources :posts, only: [:create, :edit, :update]

  resources :comments, only: [:create]

  get "users/my_profile"
  patch "users/update" =>"users#update", as: "user"
  delete "posts/:id" => "posts#destroy", as: "post_destroy"
  delete "comments/:id" => "comments#destroy", as:"comment_destroy"

  root "posts#index"
  
end
