Rails.application.routes.draw do
  get 'reviews/rating'
  get 'reviews/content'
  resources :restaurants do
  resources :reviews, only: [:new, :create]
  end
  resources :reviews, only: [:destroy]
end
