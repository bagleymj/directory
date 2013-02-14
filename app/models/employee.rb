class Employee < ActiveRecord::Base
  attr_accessible :address1, :address2, :city, :location_id, :state, :zip, :first_name, :last_name,
    :middle_name, :birthday, :mobile_num, :home_num, :hire_date

  belongs_to :location

  def name
    first_name + " " + last_name
  end


end
