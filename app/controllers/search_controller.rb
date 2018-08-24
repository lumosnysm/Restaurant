class SearchController < ApplicationController
  def index
    @dishes = Dish.search_by_name params[:sub_keywords]
    if params[:keywords_search]
      @dishes = Dish.search_by_name params[:keywords_search]
      flash.now[:success] = "#{@dishes.count} #{params[:keywords_search]} " + t(".message_success")
    else
      respond_to do |format|
        format.js
      end
    end
  end
end
