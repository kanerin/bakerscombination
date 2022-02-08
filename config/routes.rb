Rails.application.routes.draw do

  #devise_for :users
  
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }
  devise_scope :user do
    # TIPS: ユーザー登録しっぱいのリダイレクトのエラーを防ぐ https://github.com/heartcombo/devise/blob/master/app/controllers/devise/registrations_controller.rb
    get '/users', to: 'devise/registrations#new'
  end

  resources :users
  
  post 'bakerscombinations/calculation/:id' => 'bakerscombinations#calculation',as: 'bakerscombinationscalculation'
  get 'users/default/:id' => 'users#default',as:'usersdefault'
  

  resources :bakerscombinations do
    resources :likes, only: [:create, :destroy]
    resources :reviews, only:[:index, :create]
  end

  root 'bakerscombinations#index'
  
end
