module Admin
  class CategoriesController < ApplicationController
    layout "layouts/admin"
    before_action :logged_in_user, :admin_user
    before_action :load_category, only: %i(edit destroy update)

    def index
      @category = Category.new
      @categories = Category.lastest
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

    def destroy
      if @category.destroy
        flash[:success] = t ".deleted"
      else
        flash[:danger] = t ".not_delete"
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
      params.require(:category).permit :name
    end

    def load_category
      @category = Category.find_by id: params[:id]
      return if @category
      flash[:danger] = t ".not_found"
      redirect_to admin_categories_url
    end
  end
end
