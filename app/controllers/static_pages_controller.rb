class StaticPagesController < ApplicationController
  def home
    @reviews = Review.lastest.list
    @reservation = Reservation.new
  end
end
