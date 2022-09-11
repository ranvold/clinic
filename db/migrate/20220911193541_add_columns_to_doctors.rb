class AddColumnsToDoctors < ActiveRecord::Migration[7.0]
  def change
    add_column :doctors, :first_name, :text
    add_column :doctors, :last_name, :text
  end
end
