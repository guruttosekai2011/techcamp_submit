Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [:show, :edit, :update]
  resources :memos, only: [:create, :edit, :update, :destroy, :show] do
    collection do
      get 'search'
      get 'stack_search'
    end
  end
  post 'memos/new_create' => 'memos#new_create'
  root to: "top#index"

  # Latest Number : 3

  # INTRODUCTION
  get '1' => 'lectures#intro1'

  # Machine Learning SYSTEM
  get '3' => 'lectures#mls1'
  
  # NLP
  get '2' => 'lectures#nlp1'

end
