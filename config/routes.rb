Rails.application.routes.draw do
  get 'checkout', to: 'checkout#index'
  get 'checkout/payment'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  root 'home#index'  
end
