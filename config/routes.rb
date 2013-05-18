BaseApp::Application.routes.draw do

  resources :payment_notifications


  resources :contracts


  resources :invoices
  match 'invoices/:id/mail' => 'invoices#mail', as: :mail

  resources :clients


  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  get "pages/index"

  match "/admin" => "admin/base#index", :as => "admin"

  namespace "admin" do

    resources :users
    resources :categories

  end

  resources :users, :only => [:edit, :update, :show]

  root :to => "pages#index"

end
