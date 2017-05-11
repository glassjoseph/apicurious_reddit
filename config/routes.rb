Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  root 'home#index'

  get 'auth/reddit', as: "reddit_login"

  get 'auth/reddit/callback', to: "sessions#create"


  # get 'r/:id', as: "subreddit"
  resources :subreddits, path: "r", only: [:index, :show]

end
