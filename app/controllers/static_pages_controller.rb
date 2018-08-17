class StaticPagesController < ApplicationController
  def home
    @reviews = Review.lastest.list
  end
end
