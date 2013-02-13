class EmployeeReferencesLocation < ActiveRecord::Migration
  def change
    change_table :employees do |t|
      t.references :location
    end
  end

end
