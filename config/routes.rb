Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  root 'home#index'

  get 'auth/reddit', as: "reddit_login"

  get 'auth/reddit/callback', to: "sessions#create"


  resources :subreddits, path: "r", only: [:index, :show] do
    get '/comments/:id(.:format)', to: "posts#show", as: "post"
  end

end
