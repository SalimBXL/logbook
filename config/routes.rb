Rails.application.routes.draw do
  
  namespace :api do
    namespace :v1 do
      post "login", to: "authentication#login"
      resources :users
      resources :articles
    end
  end

  get "ping", to: "ping#index"
end
