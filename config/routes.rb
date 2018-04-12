Rails.application.routes.draw do
  #  match '/api/v1/athletes/*', via: [:options], to: lambda {|_| [204, { 'Content-Type' => 'text/plain' }]}
  root controller: :athletes, action: :index

authenticate :user do
  resources :athletes, shallow: true
  put 'toggle/:id', to: 'athletes#toggle', as: :toggle_voting
  put 'publish', to: 'athletes#publish', as: :publish
  put 'revert', to: 'athletes#revert', as: :revert_results
end
  devise_for :users

  namespace :api do
    namespace :v1 do
      resources :athletes, except: [:new]
      post 'athletes/voting/:id', to: 'athletes#voting', as: :updated_votes, via: [:options]
      resources :results, only: [:index]
      mount_devise_token_auth_for 'User', at: 'auth'
    end
  end
end
