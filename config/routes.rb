Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :posses, only: [:index, :show]
      resources :problems, only: [:index, :show]
      resources :solutions, only: [:index, :show, :create]
      resources :coderunner
    end
  end

  get "/auth/:provider/callback", to: "sessions#create"
end
