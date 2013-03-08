class ChangeCellColumnNames < ActiveRecord::Migration
  def change
    change_table :employees do |t|
      t.rename    :p_mobile_num, :personal_cell
      t.rename    :c_mobile_num, :company_cell
    end
  end
end
