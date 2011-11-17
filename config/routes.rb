MontrealRbTools::Application.routes.draw do
  resources :talks, :only => [:index, :new, :create]

  root :to => 'talks#index'
end
