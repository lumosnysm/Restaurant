module Admin
  class MenuDetailsController < AdminBaseController
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
      @menudetail = MenuDetail.find_by dish_id: params[:id]
      if @menudetail.destroy
        flash[:success] = "deleted"
      else
        flash[:danger] = "not deleted"
      end
      redirect_to request.referrer
    end

    private

    def menudetails_params
      params.require(:menu_detail).permit :category_id, :dish_id
    end
  end
end
