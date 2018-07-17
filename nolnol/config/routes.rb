Rails.application.routes.draw do

  root 'home#index'

  get 'myboard/index' => 'myboard#index'
  get 'myboard/index2' => 'myboard#index2'

  get 'jujum/index'
  get 'jujum/num2'
  get 'jujum/num3'
  get 'jujum/num4'
  get 'jujum/num5'
  get 'jujum/num6'
  get 'jujum/num7'
  get 'jujum/num8'
  get 'jujum/num9'
  get 'jujum/num10'
  resources :boards
  get "/user" => "errorstation#emailover"
  post '/boards/:board_id' =>"boards#comment"

  get 'followlist/' => 'followlist#index'
  get '/agree' =>"agree#index"
  get '/watching_people' => 'watching_people#index'
  get '/line_up' => 'line_up#index'
  get '/my_profile' => 'my_profile#index'
  get 'info_page/' => 'info_page#index'
  get 'chat_rooms/' => 'chat_rooms#index'
  resources :chat_rooms, only: [:new, :create, :show, :index]
  resources :follows, only: [:create, :destroy]

  # mailbox folder routes
  get "mailbox/inbox" => "mailbox#inbox", as: :mailbox_inbox
  get "mailbox/sent" => "mailbox#sent", as: :mailbox_sent
  get "mailbox/trash" => "mailbox#trash", as: :mailbox_trash

  resources :conversations do
    member do
      post :reply
      post :trash
      post :untrash
    end
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  ## devise controllers for users
  devise_for :user, controllers: {
    # confirmations: 'users/confirmations',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    # unlocks: 'users/unlocks',
  }, skip: [:sessions]

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'
  ## custom routes for users
  as :user do
    get 'login' => 'users/sessions#new', as: :new_user_session
    post 'login' => 'users/sessions#create', as: :user_session
    get 'logout' => 'users/sessions#destroy',to: redirect('/login'), as: :destroy_user_session
    get 'register' => 'users/registrations#new'
    get 'profile_edit' => 'users/registrations#edit'
  end
end
