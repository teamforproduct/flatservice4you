Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  scope "/(:locale)" do
    root 'home#index'

    resources :users, only: [:create]
  end

  match 'auth/:provider/callback', to: 'users#facebook', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
end
