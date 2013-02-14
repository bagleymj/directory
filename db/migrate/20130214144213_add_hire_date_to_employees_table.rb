class AddHireDateToEmployeesTable < ActiveRecord::Migration
  def change
    change_table :employees do |t|
      t.date :hire_date
    end
  end
end
