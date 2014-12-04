Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :posses, only: [:index, :show]
      resources :problems, only: [:index, :show]
      resources :solutions, only: [:index, :show, :create, :update] do
        member do
          get :like
          get :remove_like
        end
      end
      resources :coderunner
      resources :votes
      resources :users, only: [:create, :index, :show] do
        collection do
          get :current
        end
      end
    end
  end
  match 'solutions' => redirect('/')
  match 'solutions/*' => redirect('/')
  match 'users' => redirect('/')
  match 'users/*' => redirect('/')
  match 'problems' => redirect('/')
  match 'problems/*' => redirect('/')
  match 'posses' => redirect('/')
  match 'posses/*' => redirect('/')

  root "pages#home"
  get "/auth/:provider/callback", to: "sessions#create"
  get 'signout', to: 'sessions#destroy'
  get 'close_window', to: 'sessions#close_window'
end
