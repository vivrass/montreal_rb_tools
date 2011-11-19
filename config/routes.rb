MontrealRbTools::Application.routes.draw do
  resources :sessions, :only => [:create] do 
    collection do
      get "test", as: :collection
    end
  end
  resources :talks, :only => [:index, :new, :create]

  # FIXME : Change #test for #create"
  match '/auth/twitter/callback', to: 'sessions#test'

  root :to => 'talks#index'
end
