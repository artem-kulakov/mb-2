Rails.application.routes.draw do
  resources :posts
  get 'checkout/user_info'
  post 'checkout/update_user_info'

  get 'checkout/payment'
  post 'checkout/charge_card'
  post 'checkout/charge_source'
  get 'checkout/did_customer_react'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  root 'home#index'  
end
