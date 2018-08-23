class MenusController < ApplicationController
  before_action :load_menu, only: :show

  def index
    @menus = Menu.lastest
  end

  def show
    @categories = @menu.categories.distinct
    @dishes = @menu.dishes.distinct
  end

  private

  def load_menu
    @menu = Menu.find_by id: params[:id]
    return if @menu
    flash[:danger] = t ".not_found"
    redirect_to menus_url
  end
end
