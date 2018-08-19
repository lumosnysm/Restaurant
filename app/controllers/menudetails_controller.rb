class MenudetailsController < ApplicationController
  before_action :logged_in_user, :admin_user
  before_action :load_menu, only: :create
  before_action :load_menudetail, only: :destroy

  def create
    @menu = Menu.find_by id: params[:menu_id]
    @menudetail = @menu.picks.build menudetails_params
    if @menudetail.save
      flash[:success] = "created"
    else
      flash[:danger] = "not created"
    end
    redirect_to request.referrer
  end

  def destroy
    @menudetail = Menudetail.find_by id: params[:id]
    if @menudetail.destroy
      flash[:success] = "deleted"
    else
      flash[:danger] = "not deleted"
    end
    redirect_to request.referrer
  end

  private

  def menudetails_params
    params.require(:menudetail).permit :category_id, :dish_id
  end

  def load_menu
    @menu = Menu.find_by id: params[:menu_id]
    return if @menu
    flash[:danger] = t ".not_found"
    redirect_to menus_url
  end

  def load_menudetail
    @menudetail = Menudetail.find_by id: params[:id]
    return if @menudetail
    flash[:danger] = t ".not_found"
    redirect_to menus_url
  end
end
