Frolfr::Application.routes.draw do
  root to: 'dashboard#show'

  namespace :api do
    resources :courses
    resources :rounds
  end

  get '*path', to: 'dashboard#show'
end
