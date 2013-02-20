class FinalizeTableFields < ActiveRecord::Migration
  def change
    change_table :employees do |t|
      t.remove    :middle_name
      t.string    :extension
      t.string    :job_title
    end
  end
end
