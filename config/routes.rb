Frolfr::Application.routes.draw do
  root to: 'dashboard#show'

  namespace :api do
    resources :courses
    resources :users
  end

  get '*path', to: 'dashboard#show'
end
