class Supports::Dish < ApplicationController
  def initialize params
    @params = params[:params]
    @dish = params[:dish]
  end

  def comment
    Comment.new
  end
end