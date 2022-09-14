class AppointmentsController < ApplicationController
  before_action :require_login

  def index
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  def new
    @appointment = Appointment.new
    @doctors_for_appointment = Doctor.doctors_for_select
  end

  def create
    @appointment = Appointment.new(appointment_params)

    @appointment.patient = current_patient

    if @appointment.save
      redirect_to @appointment
    else
      @doctors_for_appointment = Doctor.doctors_for_select
      render :new, status: :unprocessable_entity
    end
  end

  private
    
    def appointment_params
      params.require(:appointment).permit(:doctor_id, :date, :recommendation)
    end

    def require_login
      unless doctor_signed_in? || patient_signed_in?
        flash[:alert] = "You must be logged in to access this section"
        redirect_to root_path
      end
    end
end
