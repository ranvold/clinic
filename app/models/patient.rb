class Patient < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
end
