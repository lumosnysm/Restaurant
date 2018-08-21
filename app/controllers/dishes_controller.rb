class DishesController < ApplicationController
  before_action :load_dish, except: :create
  before_action :logged_in_user, :admin_user, except: :show

  def show; end

  def create
    @category = Category.find_by id: params[:category_id]
    @dish = @category.dishes.build dish_params
    if @dish.save
      flash[:success] = t ".message_success"
      redirect_to @category
    else
      flash[:danger] = t ".message_danger"
      redirect_to request.referrer
    end
  end

  def destroy
    if @dish.destroy
      flash[:success] = t ".message_success"
    else
      flash[:danger] = t ".message_danger"
    end
    redirect_to request.referrer
  end

  private

  def load_dish
    @dish = Dish.find_by id: params[:id]
    return if @dish
    flash.now[:danger] = t ".message_danger"
    redirect_to root_url
  end

  def dish_params
    params.require(:dish).permit :name, :price, :description, :image
  end
end
