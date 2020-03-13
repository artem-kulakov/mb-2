Rails.application.routes.draw do
  get 'checkout', to: 'checkout#index'
  get 'payment', to: 'checkout#payment'
  post 'checkout/update_user'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  root 'home#index'  
end
