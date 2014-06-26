Rails.application.routes.draw do

  root "restaurants#index"

  resources :users, :only => [:create, :new]

  resources :reservations

  resources :restaurants, :except => [:destroy] do
    resources :reservations, :only => [:show, :create, :destroy]
  end

  resources :sessions, :only => [:new, :create, :destroy]

end
