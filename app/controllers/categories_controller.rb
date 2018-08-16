class CategoriesController < ApplicationController
  before_action :logged_in_user
  before_action :load_category, only: %i(show destroy update)

  def index
    @categories = Category.all.lastest
    @category = Category.new
  end

  def show
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = t ".message_success"
    else
      flash[:danger] = t ".message_danger"
    end
    redirect_to categories_url
  end

  def destroy
    if @category.destroy
      flash[:success] = t ".deleted"
    else
      flash[:danger] = t ".not_delete"
    end
    redirect_to categories_url
  end

  def update
    if @category.update_attributes category_params
      flash[:success] = t ".updated"
    else
      flash[:danger] = t ".not_update"
    end
    redirect_to @category
  end

  private

  def category_params
    params.require(:category).permit :name
  end

  def load_category
    @category = Category.find_by id: params[:id]
    return if @category
    flash[:danger] = t ".not_found"
    redirect_to categories_url
  end
end
