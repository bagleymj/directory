class Employee < ActiveRecord::Base
  attr_accessible :address1, :address2, :city, :location_id, :name, :state, :zip

  belongs_to :location

end
