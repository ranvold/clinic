class ChangeFieldsPatientsFromTextToString < ActiveRecord::Migration[7.0]
  def change
    change_column :patients, :first_name, :string
    change_column :patients, :last_name, :string
  end
end
