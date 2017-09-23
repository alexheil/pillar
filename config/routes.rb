Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'static_pages#home'

  get 'about' => 'static_pages#about'
  get 'terms_of_use' => 'static_pages#terms_of_use'
  get 'privacy_policy' => 'static_pages#privacy_policy'
  get 'faq' => 'static_pages#faq'
  get 'stats' => 'static_pages#stats'
  get 'why' => 'static_pages#why'
  get 'register' => 'static_pages#register'
  get 'sign_in' => 'static_pages#sign_in'

  devise_for :artists, controllers: { sessions: "artists/sessions", passwords: "artists/passwords", registrations: "artists/registrations", confirmations: "artists/confirmations",  unlocks: "artists/unlocks"}

  devise_scope :artist do
    get "sign_out", to: "artists/sessions#destroy"
  end

  resources :artists, controller: 'artists/artists', only: [:show, :index] do
    resource :profile, controller: 'artists/profiles', only: [:edit, :update]
    resource :genre, controller: 'artists/genres', only: [:edit, :update]
    resource :location, controller: 'artists/locations', only: [:edit, :update]
    resource :theme, controller: 'artists/themes', only: [:edit, :update]
    resources :members, controller: 'artists/members', only: [:create, :update]
  end

end
