class ChangeEmployeesTable < ActiveRecord::Migration
  def up
    remove_column :employees, :location_id
    add_column :employees, :birthday, :date
    add_column :employees, :mobile_num, :string
    add_column :employees, :home_num, :string
  end

  def down
    add_column :employees, :location_id, :integer
    remove_column :employees, :birthday
    remove_column :employees, :mobile_num
    remove_column :employees, :home_num
  end
end
