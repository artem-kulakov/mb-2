Rails.application.routes.draw do
  get 'checkout/user_info'
  post 'checkout/update_user_info'

  get 'checkout/payment'
  post 'checkout/charge_card'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  root 'home#index'  
end
