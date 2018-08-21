class ReservationsController < ApplicationController
  before_action :logged_in_user
  before_action :check_all_done, only: :create

  def index
    @reservations = Reservation.lastest
    @reservation = Reservation.new
  end

  def create
    reservation = params[:reservation]
    date = reservation[:input_date]
    time = reservation[:input_time]
    reservation_time = DateTime.parse("#{date} #{time}").
      strftime("%Y-%m-%d %H:%M:%S")
    @reservation = current_user.reservations.build
    @reservation.time = reservation_time
    if @reservation.save
      flash[:success] = "saved"
    else
      flash[:danger] = "not save"
    end
    redirect_back fallback_location: root_url
  end

  def update
    @reservation = Reservation.find_by id: params[:id]
    if @reservation.update_attributes status: true
      flash[:success] = t ".updated"
    else
      flash[:danger] = t ".not_update"
    end
    redirect_back fallback_location: root_url
  end

  private

  def check_all_done
    if current_user.reservations.inprogress.count > 0
      flash[:warning] = t ".inprogress"
      redirect_back fallback_location: root_url
    end
  end
end
