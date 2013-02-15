class AddPhotoColumnsToEmployeees < ActiveRecord::Migration
  def change
    change_table :employees do |t|
      t.attachment  :photo
    end
  end
end
