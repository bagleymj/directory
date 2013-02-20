class CreateFamilyMembers < ActiveRecord::Migration
  def change
    create_table :family_members do |t|
      t.string :first_name
      t.string :last_name
      t.string :relationship
      t.date :birthday
      t.references :employee

      t.timestamps
    end
  end
end
