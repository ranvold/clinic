class AppointmentsController < ApplicationController
  before_action :require_login
  before_action :set_appointment, only: [:show, :edit, :update]

  def index
    @dashboard = current_patient || current_doctor
    @dashboard = @dashboard.appointments
  end

  def show
    @doctors_name = @appointment.get_doctors_full_name
    @patients_name = @appointment.get_patients_full_name
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

  def edit
  end

  def update
    if @appointment.update(appointment_params)
      redirect_to @appointment
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
    
    def appointment_params
      params.require(:appointment).permit(:doctor_id, :date, :recommendation)
    end

    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    def require_login
      unless doctor_signed_in? || patient_signed_in?
        flash[:alert] = "You must be logged in to access this section"
        redirect_to root_path
      end
    end
end
