Rails.application.routes.draw do
  root "followers#index"

  resources :followers do
    resources :posts
  end

  resources :posts do
    resources :comments
  end
end
