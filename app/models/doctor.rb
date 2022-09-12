class Doctor < ApplicationRecord
  devise :database_authenticatable, :rememberable, :validatable
end
