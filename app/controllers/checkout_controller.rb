class CheckoutController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def update_user
    @user = current_user
    puts 'foobar'
    puts params
  end

  def payment
  end
end
