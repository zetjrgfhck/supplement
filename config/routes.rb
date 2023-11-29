Rails.application.routes.draw do

# 顧客用
# URL /users/sign_in ...
devise_for :users, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, controllers: {
  sessions: "admin/sessions"
}

namespace :admin do
    root to: "homes#top"
    get "admin" => "homes#top"
    resources :users, only: [:index, :show, :edit, :update]
    resources :comments
    resources :reviews

  end



root to: "public/homes#top"
get "/home/about" =>"public/homes#about" ,as: "about"

scope module: :public  do
  resources :comments
  resources :users, only: [] do
    resources :reviews, only: [:index], controller: :user_reviews
  end
  resources :reviews do
    resources :comments, only: [:create]
    resource :bookmark, only: [:create, :destroy]
  end


  get "users/my_page" => "users#show"
  get "users/informetion/edit" => "users#edit"
  patch "users/informetion" => "users#update"
  get "users/quit" => "users#quit"
  patch "users/leave" => "users#leave"
  end
end