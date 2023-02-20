Rails.application.routes.draw do

  devise_for :users

  root to: "homes#top"
  get "home/about" => "homes#about", as: "about"
  delete 'books/:id' => 'books#destroy', as: 'destroy_book'

  resources :books, only:[:index, :show, :create, :update, :edit] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end

  resources :users, only: [:show, :edit, :index, :update]  do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end

end
