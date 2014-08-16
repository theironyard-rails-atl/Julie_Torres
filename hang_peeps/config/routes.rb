Rails.application.routes.draw do
  resources :games

    get  '/' => 'users#select'
    post '/change_user' => 'users#change'

end
