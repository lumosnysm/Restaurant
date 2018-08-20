class ReservationsController < ApplicationController
  before_action :logged_in_user

  def show
    @order = current_order
  end
end
