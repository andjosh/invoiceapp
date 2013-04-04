BaseApp::Application.routes.draw do

  resources :invoices


  resources :clients


  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  get "pages/index"

  match "/admin" => "admin/base#index", :as => "admin"

  namespace "admin" do

    resources :users

  end

  resources :clients
  resources :invoices

  resources :users, :only => [:edit, :update]

  root :to => "pages#index"

end
