class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def full_name
    "#{first_name} #{last_name}"
  end
end
