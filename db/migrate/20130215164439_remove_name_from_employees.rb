class RemoveNameFromEmployees < ActiveRecord::Migration
  def up
    remove_column :employees, :name
  end

  def down
    add_column :employees, :name, :string
  end
end
