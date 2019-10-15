Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'
  get 'play/:id' => 'game#play'
  # get 'signup'  => 'messages#new'
  # get 'messages/new'
  # get 'static_pages/home'
  get 'help'    => 'static_pages#help'
  get 'about'   => 'static_pages#about'
  root 'static_pages#home'
  get 'signup'  => 'users#new'

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  resources :messages
  resources :picks
  resources :users
  resources :games
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
