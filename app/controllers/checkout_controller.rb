class CheckoutController < ApplicationController
  before_action :authenticate_user!

  def index
    @countries = CS.countries
  end

  def update_user
    current_user.update(user_params)
  end

  def payment
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
