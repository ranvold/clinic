class Appointment < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor
  
  validates :date, presence: true
end
