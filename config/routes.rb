Frolfr::Application.routes.draw do
  root to: 'dashboard#show'

  namespace :api do
    resources :courses
    resources :rounds, only: [:index]
  end

  get '*path', to: 'dashboard#show'
end
