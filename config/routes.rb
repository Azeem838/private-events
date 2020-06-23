Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'users/:id', to: 'users#show', :as => :user
  resources :events, only: [:new, :index, :show, :create]

  root to: "events#index"
end
