module Admin
  class StaffsController < AdminBaseController
    before_action :load_staff, except: %i(create index)

    def index
      @staffs = Staff.lastest
    end

    def edit; end

    def create
      @role = Role.find_by id: params[:role_id]
      @staff = @role.staffs.build staff_params
      if @staff.save
        flash[:success] = t ".message_success"
      else
        flash[:danger] = t ".message_danger"
      end
      redirect_back fallback_location: admin_roles_url
    end

    def destroy
      if @staff.destroy
        flash[:success] = t ".deleted"
      else
        flash[:danger] = t ".not_delete"
      end
      redirect_back fallback_location: admin_roles_url
    end

    def update
      if @staff.update_attributes staff_params
        flash[:success] = t ".updated"
      else
        flash[:danger] = t ".not_update"
      end
      redirect_back fallback_location: admin_roles_url
    end

    private

    def staff_params
      params.require(:staff).permit :name, :email, :address
    end

    def load_staff
      @staff = Staff.find_by id: params[:id]
      return if @staff
      flash[:danger] = t ".not_found"
      redirect_to admin_url
    end
  end
end
