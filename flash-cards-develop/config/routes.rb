Rails.application.routes.draw do
  devise_for :users
  resources :users
  # get 'users/index'
  # get 'users/show'
  # get 'users/edit'

  root 'static_pages#home'

  get 'standard_game_mode/index'
  post 'standard_game_mode/next_card'
  post 'standard_game_mode/start'

  get 'home' => 'static_pages#home'
  get 'about' => 'static_pages#about'

  get 'categories' => 'categories#index'
  get 'category' => 'categories#show'

  get 'collections/my_filter'
  resources :collections do
    resources :cards
    resources :reviews
  end
end
