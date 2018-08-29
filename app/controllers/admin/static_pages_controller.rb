module Admin
  class StaticPagesController < AdminBaseController
    def index
      if params[:search]
        @dishes = Dish.search_by_name(params[:search]).page(params[:page]).per Settings.per_page
      else
        @dishes = Dish.lastest.page(params[:page]).per Settings.per_page
      end
    end
  end
end
