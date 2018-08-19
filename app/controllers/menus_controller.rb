class MenusController < ApplicationController
  before_action :logged_in_user, except: %i(index show)
  before_action :load_menu, :admin_user, only: %i(show destroy update)

  def index
    @menu = Menu.new
    @menus = Menu.all.lastest
  end

  def show
    @menudetail = @menu.picks.build
    @categories = @menu.categories.distinct
    @dishes = @menu.dishes.distinct
  end

  def create
    @menu = Menu.new menu_params
    if @menu.save
      flash[:success] = t ".message_success"
    else
      flash[:danger] = t ".message_danger"
    end
    redirect_to menus_url
  end

  def destroy
    if @menu.destroy
      flash[:success] = t ".deleted"
    else
      flash[:danger] = t ".not_delete"
    end
    redirect_to menus_url
  end

  def update
    if @menu.update_attributes menu_params
      flash[:success] = t ".updated"
    else
      flash[:danger] = t ".not_update"
    end
    redirect_to @menu
  end

  private

  def menu_params
    params.require(:menu).permit :name
  end

  def load_menu
    @menu = Menu.find_by id: params[:id]
    return if @menu
    flash[:danger] = t ".not_found"
    redirect_to menus_url
  end
end
