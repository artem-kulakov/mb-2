class CheckoutController < ApplicationController
  before_action :authenticate_user!
  
  def index
  end

  def payment
  end
end
