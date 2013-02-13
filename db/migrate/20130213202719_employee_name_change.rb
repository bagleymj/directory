class EmployeeNameChange < ActiveRecord::Migration
  def change
    change_table :employees do |t|
      t.rename :name, :first_name
      t.string :middle_name
      t.string :last_name
    end
  end
end
