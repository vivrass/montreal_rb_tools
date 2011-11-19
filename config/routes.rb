MontrealRbTools::Application.routes.draw do
  resources :sessions, :only => [:create] do 
    collection do
      get "test", as: :collection
    end
  end
  resources :talks, :only => [:index, :new, :create]

  resources :users, :only => [:edit]
  match '/auth/twitter/callback', to: 'users#create'

  root :to => 'talks#index'
end
