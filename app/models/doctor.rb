class Doctor < ApplicationRecord
  devise :database_authenticatable, :rememberable, :validatable
         :confirmable
  belongs_to :category

  has_many :appointments, dependent: :destroy
  has_many :patients, through: :appointments

  validates :first_name, presence: true
  validates :last_name, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
