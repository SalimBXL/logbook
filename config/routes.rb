Rails.application.routes.draw do
  resources :articles
  resources :users
  post "login", to: "authentication#login"
end
