class ChangeFieldsDoctorsFromTextToString < ActiveRecord::Migration[7.0]
  def change
    change_column :doctors, :first_name, :string
    change_column :doctors, :last_name, :string
  end
end
