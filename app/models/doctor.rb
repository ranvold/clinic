class Doctor < ApplicationRecord
  devise :database_authenticatable, :rememberable, :validatable,
         :recoverable

  belongs_to :category

  has_many :appointments, dependent: :destroy
  has_many :patients, through: :appointments

  validates :first_name, presence: true
  validates :last_name, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end

  after_create { |admin| admin.send_reset_password_instructions }
  def password_required?
    new_record? ? false : super
  end
end
