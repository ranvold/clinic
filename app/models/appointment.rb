class Appointment < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor

  validates :date, presence: true

  def get_doctors_full_name
    self.doctor.full_name
  end

  def get_patients_full_name
    self.patient.full_name
  end
end
