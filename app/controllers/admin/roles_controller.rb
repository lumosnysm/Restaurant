module Admin
  class RolesController < AdminBaseController
    before_action :load_role, except: %i(index create)

    def index
      @role = Role.new
      @roles = Role.lastest
    end

    def show
      @staff = @role.staffs.build
      @staffs = @role.staffs.lastest
    end

    def edit; end

    def create
      @role = Role.new role_params
      if @role.save
        flash[:success] = t ".message_success"
      else
        flash[:danger] = t ".message_danger"
      end
      redirect_back fallback_location: admin_roles_url
    end

    def destroy
      @staffs = Staff.role_staffs(@role).count
      if @staffs > 0
        flash[:danger] = t ".not_delete"
      else
        if @role.destroy
          flash[:success] = t ".deleted"
        else
          flash[:danger] = t ".not_delete"
        end
      end
      redirect_back fallback_location: admin_roles_url
    end

    def update
      if @role.update_attributes role_params
        flash[:success] = t ".updated"
      else
        flash[:danger] = t ".not_update"
      end
      redirect_back fallback_location: admin_roles_url
    end

    private

    def role_params
      params.require(:role).permit :name, :salary, :description
    end

    def load_role
      @role = Role.find_by id: params[:id]
      return if @role
      flash[:danger] = t ".not_found"
      redirect_to admin_roles_url
    end
  end
end
