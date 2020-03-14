class CheckoutController < ApplicationController
  before_action :authenticate_user!, except: %i[charge_source]
  skip_before_action :verify_authenticity_token
  before_action :set_stripe_secret_key, only: %i[charge_card charge_source]

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
    token = params[:stripeToken]

    charge = Stripe::Charge.create({
      amount: 999,
      currency: 'usd',
      description: 'Example charge',
      source: token,
    })
  end

  # Webhook to charge Alipay or WeChat Pay
  def charge_source
    type = params[:data][:object][:type]

    status = params[:type]

    source = params[:data][:object][:id]

    amount = params[:data][:object][:amount]

    if status == 'source.chargeable'
      charge = Stripe::Charge.create({
        amount: amount,
        currency: 'usd',
        description: 'Alipay or WeChat Pay',
        source: source,
      })
    end
  end

  # Check if WeChat customer authorized or declined payment
  def did_customer_react
    source_id = params[:id]

    source = Stripe::Source.retrieve(
      source_id,
    )

    unless source.nil?
      status = source[:status]

      unless status == 'pending'
        render json: {response: 'yes'}
      else
        render json: {response: 'no'}
      end
    end
  end

  private

    def set_stripe_secret_key
      Stripe.api_key = Rails.application.credentials.stripe[:api_key]
    end

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
