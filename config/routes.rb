Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  scope "/(:locale)" do
    root 'home#index'

    resources :users, only: [:create]
  end
end
