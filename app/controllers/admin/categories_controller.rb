module Admin
  class CategoriesController < AdminBaseController
    before_action :load_category, except: %i(index create)

    def index
      @category = Category.new
      @categories = Category.lastest
    end

    def show
      @dish = @category.dishes.build
      @dishes = @category.dishes.lastest
    end

    def edit; end

    def create
      @category = Category.new category_params
      if @category.save
        flash[:success] = t ".message_success"
      else
        flash[:danger] = t ".message_danger"
      end
      redirect_back fallback_location: admin_categories_url
    end

    def update
      if @category.update_attributes category_params
        flash[:success] = t ".updated"
      else
        flash[:danger] = t ".not_update"
      end
      redirect_back fallback_location: admin_categories_url
    end

    private

    def category_params
      params.require(:category).permit :name, dishes_attributes:
        [:id, :name, :price, :description, :image, :_destroy]
    end

    def load_category
      @category = Category.find_by id: params[:id]
      return if @category
      flash[:danger] = t ".not_found"
      redirect_to admin_categories_url
    end
  end
end
