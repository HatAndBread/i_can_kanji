Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    registrations:  'overrides/registrations', sessions: 'overrides/sessions'}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root to: "pages#home"
  get "/home", to: "pages#home"
  get "/users", to: "users#index"
  resources :study_sets, only: [:index, :create, :update, :destroy]
end
