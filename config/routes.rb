Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    namespace :v1 do
      resources :users, only: %i[index create] do
        resources :posts, only: [:index] do
          resources :comments, only: %i[index create]
        end
      end
    end
  end

  root 'users#index'
  resources :users, only: %i[show index] do
    resources :posts, only: %i[index show new create destroy] do
      resources :comments, only: %i[index new create destroy]
      resources :likes, only: %i[create]
    end
  end
  # get '/users/:user_id/posts', to: 'posts#index', as: 'user_posts'
  # get '/users/:user_id/posts/:id', to: 'posts#show', as: 'user_post'
  # get '/users/:user_id/posts/new', to: 'posts#new', as: 'new_post'
end
