class CheckoutController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  def user_info
    @countries = CS.countries
    render 'checkout'
  end

  def update_user_info
    if current_user.update(user_params)
      redirect_to checkout_payment_path
    end
  end

  def payment
    render 'checkout'
  end

  def charge_card
    # Set your secret key. Remember to switch to your live secret key in production!
    # See your keys here: https://dashboard.stripe.com/account/apikeys
    Stripe.api_key = 'sk_test_0m79ESPioZi6qHal8HQBq4M400KUECKnRc'

    # Token is created using Stripe Checkout or Elements!
    # Get the payment token ID submitted by the form:
    token = params[:stripeToken]

    charge = Stripe::Charge.create({
      amount: 999,
      currency: 'usd',
      description: 'Example charge',
      source: token,
    })
  end

  def charge_alipay
    # Set your secret key: remember to change this to your live secret key in production
    # See your keys here: https://dashboard.stripe.com/account/apikeys
    Stripe.api_key = 'sk_test_0m79ESPioZi6qHal8HQBq4M400KUECKnRc'

    # Token is created using Stripe Checkout or Elements!
    # Get the payment token ID submitted by the form:
    source = params[:source]

    charge = Stripe::Charge.create({
      amount: 10999,
      currency: 'usd',
      description: 'Example charge',
      source: source,
    })

    redirect_to checkout_payment_path
  end

  private

    def user_params
      params.require(:user).permit(
        :first_name,
        :last_name,
        :phone,
        :street,
        :apartment,
        :city,
        :country,
        :zip
      )
    end
end
