class FamilyMember < ActiveRecord::Base
  attr_accessible :birthday, :first_name, :last_name, :relationship, :employee_id

  belongs_to :employee 

  def name
    first_name + " " + last_name
  end

end
