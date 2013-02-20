class Employee < ActiveRecord::Base
  attr_accessible :address1, :address2, :city, :location_id, :state, :zip, :first_name, :last_name, 
    :birthday, :mobile_num, :home_num, :hire_date, :photo, :email, :job_title, :extension

  belongs_to :location
  has_many :family_members

  def name
    first_name + " " + last_name
  end

  has_attached_file :photo, :styles => { :thumb => "81x108" }

end
