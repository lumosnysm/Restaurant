module Admin
  class MenusController < AdminBaseController
    before_action :load_menu, except: %i(index create)

    def index
      @menu = Menu.new
      @menus = Menu.lastest
    end

    def edit; end

    def create
      @menu = Menu.new menu_params
      if @menu.save
        flash[:success] = t ".message_success"
      else
        flash[:danger] = t ".message_danger"
      end
      redirect_back fallback_location: admin_menus_url
    end

    def destroy
      if @menu.destroy
        flash[:success] = t ".deleted"
      else
        flash[:danger] = t ".not_delete"
      end
      redirect_back fallback_location: admin_menus_url
    end

    def update
      if @menu.update_attributes menu_params
        flash[:success] = t ".updated"
      else
        flash[:danger] = t ".not_update"
      end
      redirect_back fallback_location: admin_menus_url
    end

    private

    def menu_params
      params.require(:menu).permit :name
    end

    def load_menu
      @menu = Menu.find_by id: params[:id]
      return if @menu
      flash[:danger] = t ".not_found"
      redirect_to admin_url
    end
  end
end
