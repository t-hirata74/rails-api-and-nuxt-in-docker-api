Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # user_controller
      resources :users, only:[:index]
    end
  end
end
