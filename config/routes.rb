Rails.application.routes.draw do
  root :to => 'questions#index'

  resources :users do
    resources :questions
  end
  resources :sessions

  resources :questions
end
