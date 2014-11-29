Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :posses, only: [:index, :show]
      resources :problems, only: [:index, :show]
      resources :solutions, only: [:index, :show, :create, :update]
      resources :coderunner
    end
  end

  root "pages#home"
  get "/auth/:provider/callback", to: "sessions#create"
end
