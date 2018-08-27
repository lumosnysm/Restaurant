module Admin
  class StaticPagesController < AdminBaseController
    def index
      @dishes = Dish.lastest
    end
  end
end
