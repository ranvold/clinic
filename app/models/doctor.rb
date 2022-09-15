class Doctor < ApplicationRecord
  devise :database_authenticatable, :rememberable, :validatable,
         :recoverable

  belongs_to :category

  has_many :appointments
  has_many :patients, through: :appointments

  validates :first_name, presence: true
  validates :last_name, presence: true

  APPOINMTENT_LIMIT = 9

  def self.doctors_for_select
    doctors = Doctor.all

    busy_doctors =  Doctor.joins(:appointments)
                          .select("id")
                          .where("appointments.recommendation is null")
                          .group("id")
                          .having("count(*) > ?", APPOINMTENT_LIMIT)

    doctors_in_hash = Hash.new {|h,k| h[k]=[]}

    doctors.each do |doctor|
      unless busy_doctors.include?(doctor)
        doctors_in_hash[doctor.category.name] << [doctor.full_name, doctor.id] 
      end
    end

    return doctors_in_hash 
  end

  after_create { |admin| admin.send_reset_password_instructions }
  def password_required?
    new_record? ? false : super
  end
end
