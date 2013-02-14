class AddNameFieldToEmployeesTable < ActiveRecord::Migration
  def change
    change_table :employees do |t|
      t.string  :name
    end
  end
end
