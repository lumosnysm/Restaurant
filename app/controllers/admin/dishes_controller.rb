module Admin
  class DishesController < AdminBaseController
    before_action :load_dish, except: :create

    def edit; end

    def create
      @category = Category.find_by id: params[:category_id]
      @dish = @category.dishes.build dish_params
      if @dish.save
        flash[:success] = t ".message_success"
      else
        flash[:danger] = t ".message_danger"
      end
      redirect_back fallback_location: admin_categories_url
    end

    def destroy
      if @dish.destroy
        flash[:success] = t ".deleted"
      else
        flash[:danger] = t ".not_delete"
      end
      redirect_back fallback_location: admin_categories_url
    end

    def update
      if @dish.update_attributes dish_params
        flash[:success] = t ".updated"
      else
        flash[:danger] = t ".not_update"
      end
      redirect_back fallback_location: admin_categories_url
    end

    private

    def dish_params
      params.require(:dish).permit :name, :price, :description, :image
    end

    def load_dish
      @dish = Dish.find_by id: params[:id]
      return if @dish
      flash[:danger] = t ".not_found"
      redirect_to admin_url
    end
  end
end
