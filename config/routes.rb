MontrealRbTools::Application.routes.draw do
  devise_for :users do
    get   "sign_in"  => "devise/sessions#new", :as => :sign_in
    get   "sign_out" => "devise/sessions#destroy", :as => :sign_out
    get   "sign_up" => "devise/registrations#new", :as => :sign_up
  end

  resources :talks, :only => [:index, :new, :create]

  root :to => 'talks#index'
end
