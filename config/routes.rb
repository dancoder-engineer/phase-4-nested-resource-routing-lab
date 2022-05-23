Rails.application.routes.draw do


  resources :users, only: [:show] do
    resources :items, only: [:create, :show, :index]
  end

  resources :items, only: [:index]
  
end
