class Location < ActiveRecord::Base
  attr_accessible :address1, :address2, :city, :name, :state, :zip

  has_many :employees

  zip_regex = /\A\d{5}\z/

  validates :name,        :presence =>  true,
                          :length   =>  {:maximum => 25}
  
  validates :address1,    :presence =>  true,
                          :length   =>  {:maximum => 60}
  
  validates :address2,    :length   =>  {:maximum => 60}
  
  validates :city,        :presence =>  true,
                          :length   =>  {:maximum => 20}
  
  validates :state,       :presence =>  true,
                          :length   =>  {:maximum => 2}
  
  validates :zip,         :presence =>  true,
                          :format   =>  {:with => zip_regex},
                          :allow_blank => true


end
