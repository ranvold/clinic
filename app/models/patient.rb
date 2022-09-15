class Patient < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
         :rememberable, :validatable, :recoverable

  has_many :appointments, dependent: :destroy
  has_many :doctors, through: :appointments

  validates :first_name, presence: true
  validates :last_name, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
