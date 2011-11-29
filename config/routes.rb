DuckboneTickets::Application.routes.draw do

  # JSON
  resources :tickets, :only => [:index, :show, :create, :update, :destroy] do
    resources :comments, :only => [:create, :destroy]
  end
  resources :users, :only => [:index, :show, :create, :update, :destroy]

  # HTML
  root :to => 'home#index'

end
