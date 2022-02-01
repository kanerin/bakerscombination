Rails.application.routes.draw do

  devise_for :users
  resources :users

  post 'bakerscombinations/calculation/:id' => 'bakerscombinations#calculation',as: 'bakerscombinationscalculation'

  resources :bakerscombinations do
    resources :likes, only: [:create, :destroy]
    resources :reviews, only:[:index, :create]
  end


  root 'bakerscombinations#index'
end
