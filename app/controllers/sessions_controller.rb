class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by email: params[:session][:email].downcase
    if @user&.authenticate(params[:session][:password])
      log_in @user
      if @user.admin?
        redirect_to admin_url
      else
        redirect_to root_url
      end
    else
      flash.now[:danger] = t ".message_danger"
      render :new
    end
  end

  def destroy
    session.delete :order_id
    log_out if logged_in?
    redirect_to root_url
  end
end
