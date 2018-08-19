module SessionsHelper
  def log_in user
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by id: session[:user_id]
  end

  def current_user? user
    user == current_user
  end

  def logged_in?
    current_user.present?
  end

  def log_out
    session.delete :user_id
    @current_user = nil
  end

  def admin_user
    return if current_user.admin?
    flash[:danger] = t ".not_admin"
    redirect_to root_url
  end

  def current_order
    if !session[:order_id].nil?
      Order.find_by id: session[:order_id]
    else
      current_user.orders.new
    end
  end
end
