class CheckoutController < ApplicationController
  before_action :authenticate_user!

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
