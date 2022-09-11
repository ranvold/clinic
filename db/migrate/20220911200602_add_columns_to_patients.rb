class AddColumnsToPatients < ActiveRecord::Migration[7.0]
  def change
    add_column :patients, :first_name, :text
    add_column :patients, :last_name, :text
  end
end
