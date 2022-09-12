class Doctor < ApplicationRecord
  devise :database_authenticatable, :rememberable, :validatable

  def full_name
    "#{first_name} #{last_name}"
  end
end
