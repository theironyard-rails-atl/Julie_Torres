Rails.application.routes.draw do
  resources :games

  root to: 'users#select'
    post '/change_user' => 'users#change'

end
