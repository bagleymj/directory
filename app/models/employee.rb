class Employee < ActiveRecord::Base
  attr_accessible :address1, :address2, :city, :location_id, :state, :zip, :first_name, :last_name, 
    :birthday, :mobile_num, :home_num, :hire_date, :photo, :email, :job_title, :extension

  belongs_to :location
  has_many :family_members

  def name
    first_name + " " + last_name
  end

  has_attached_file :photo, :styles => { :thumb => "81x108" }

  validates :first_name,    :presence => true

  validates :last_name,     :presence => true

  validates :email,         :presence => true

  validates :location_id,   :presence => true

  validates :job_title,     :presence => true

  validates :address1,      :presence => true

  validates :city,          :presence => true

  validates :state,         :presence => true

  validates :zip,           :presence => true

  validates :birthday,      :presence => true

  validates :hire_date,     :presence => true

end
