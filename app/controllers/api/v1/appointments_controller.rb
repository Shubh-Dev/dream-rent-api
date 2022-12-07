class Api::V1::AppointmentsController < ApplicationController
  def index
    @appointments = Appointment.all.order(:id)
    render json: @appointments
  end

  def show
    @appointment = Appointment.find(params[:id])
    render json: @appointment
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
