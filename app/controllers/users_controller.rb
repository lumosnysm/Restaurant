class UsersController < ApplicationController
  before_action :load_user, except: %i(new create index)
  before_action :correct_user, except: %i(new create)
  before_action :logged_in_user, except: %i(new create)
  
  def new
    @user = User.new
  end

  def edit; end

  def update
    if @user.update_attributes user_params
      flash[:success] = t ".message_success"
      redirect_to @user
    else
      flash[:danger] = t ".message_danger"
      render :edit
    end
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t ".welcome"
      redirect_to root_url
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation, :image
  end

  def load_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = t ".message_danger"
    redirect_to root_url
  end

  def correct_user
    @user = User.find_by id: params[:id]
    return if current_user? @user
    flash[:danger] = t ".message_danger"
    redirect_to root_url
  end
end
