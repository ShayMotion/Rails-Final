Rails.application.routes.draw do
  get 'auction/title'
  get 'auction/start_date'
  get 'auction/end_date'
  post "/api/v1/login", to: "api/v1/sessions#create"
  post "/api/v1/signup", to: "api/v1/users#create"
  delete "/api/v1/logout", to: "api/v1/sessions#destroy"
  get "api/v1/get_current_user", to: "api/v1/sessions#get_current_user"
  namespace :api do
    namespace :v1 do
      resources :brands
      resources :models
      resources :years
      resources :prices
      resources :guitars 
      resources :users
      resources :comments
    end
  end
end
