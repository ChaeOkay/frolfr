Frolfr::Application.routes.draw do
  root to: 'dashboard#show'

  namespace :api do
    resources :courses
    resources :rounds
    resources :scorecards
  end

  get '*path', to: 'dashboard#show'
end
