class AppointmentsController < ApplicationController
  def index
    @apppintments = Appointment.all.order(:id)
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  def new
    @appointment = Appointment.new
    @houses = House.all.order(:id)
    @users = User.all.order(:id)
  end

  def create
    @appointment = Appointment.create!(appoint_params)
    if @appointment.save
      render json: @appointment
    else
      @errors = @appointment.errors.full_messages
      render :new
    end
  end

  private

  def appoint_params
    params.require(:appointment).permit(:time, :date, :visitors, :user_id, :house_id)
  end
end
