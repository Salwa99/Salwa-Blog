Rails.application.routes.draw do
  devise_for :users
  root 'users#index'

  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show new create destroy] do
      resources :comments, only: %i[new create destroy]
      resources :likes, only: %i[create], as: :likes
    end
  end

  namespace :api do
    namespace :v1 do
      resources :users, only: [] do
        resources :posts, only: %i[index show create] do
          resources :comments, only: %i[index create]
        end
      end
    end
  end
end
