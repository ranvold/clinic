class AppointmentsController < ApplicationController
  before_action :require_login

  def index
  end

  def show
  end

  def new
    appointment = Appointment.new
  end

  def create
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
