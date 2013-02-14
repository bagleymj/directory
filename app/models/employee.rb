class Employee < ActiveRecord::Base
  attr_accessible :address1, :address2, :city, :location_id, :name, :state, :zip, :first_name, :last_name,
    :middle_name, :birthday, :mobile_num, :home_num

  belongs_to :location


end
