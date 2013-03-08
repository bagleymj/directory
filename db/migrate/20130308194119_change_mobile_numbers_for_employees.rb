class ChangeMobileNumbersForEmployees < ActiveRecord::Migration
  def change

    change_table :employees do |t|
      t.rename    :mobile_num, :c_mobile_num
      t.string    :p_mobile_num
    end

  end
end
