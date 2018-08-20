module Admin
  class AdminBaseController < ApplicationController
    layout "layouts/admin"
    before_action :logged_in_user, :admin_user
  end
end
