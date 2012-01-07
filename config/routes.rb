MontrealRbTools::Application.routes.draw do
  devise_for :users

  resources :talks, :only => [:index, :new, :create]

  root :to => 'talks#index'
end
