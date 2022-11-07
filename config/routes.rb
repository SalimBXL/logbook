Rails.application.routes.draw do
  
  namespace :api do
    namespace :v1 do
      resources :users
      resources :articles
    end
  end

  post "login", to: "authentication#login"
end
