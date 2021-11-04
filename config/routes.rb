Rails.application.routes.draw do
  devise_for :deviseusers
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/auth/spotify/callback', to: 'users#spotify'
end
