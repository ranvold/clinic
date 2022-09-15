class AddCategoryToDoctors < ActiveRecord::Migration[7.0]
  def change
    add_reference :doctors, :category, null: false, foreign_key: true, index: false
  end
end
