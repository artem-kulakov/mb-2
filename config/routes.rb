Rails.application.routes.draw do
  get 'checkout/index'
  get 'checkout/payment'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  root 'home#index'  
end
