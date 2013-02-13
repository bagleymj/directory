class Location < ActiveRecord::Base
  attr_accessible :address1, :address2, :city, :name, :state, :zip

  has_many :employees

end
