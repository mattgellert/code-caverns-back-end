Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/users/history', to: 'users#history'
      get '/users/resume_game', to: 'users#resume_game'
      post '/users/save_game', to: 'users#save_game'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
