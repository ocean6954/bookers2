Rails.application.routes.draw do

  devise_for :users
  root to: "homes#top"
  get "home/about" => "homes#about", as: "about"

  resources :books, only:[:index, :show, :create, :update, :edit]
  resources :users, only: [:show, :edit, :index, :update]

  delete 'books/:id' => 'books#destroy', as: 'destroy_book'

end
