Frolfr::Application.routes.draw do
  root to: 'dashboard#show'

  namespace :api do
    resources :courses
    resources :rounds
    resources :scorecards
    resources :turns
    resources :holes
  end

  get '*path', to: 'dashboard#show'
end
