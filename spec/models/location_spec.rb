require 'spec_helper'

describe Location do
  before(:each) do
    @attr = {
      :name => "New Place",
      :address1 => "123 Main Street",
      :address2 => "",
      :city => "Atlanta",
      :state => "GA",
      :zip => "54321"
    }
    @location = Location.new(@attr)
  end

  it "should create a new instance of location given valid attributes" do
    Location.create!(@attr)
  end

  subject { @location }
  it { should respond_to :name }
  it { should respond_to :address1 }
  it { should respond_to :address2 }
  it { should respond_to :city }
  it { should respond_to :state }
  it { should respond_to :zip }

  it "should require a name" do
    no_name_location = Location.new(@attr.merge(:name => ""))
    no_name_location.should_not be_valid
  end

  it "should reject a name that's too long" do
    long_name = "a" * 26
    long_name_location = Location.new(@attr.merge(:name => long_name))
    long_name_location.should_not be_valid
  end

  it "should require an address1" do
    no_address_location = Location.new(@attr.merge(:address1 => ""))
    no_address_location.should_not be_valid
  end

  it "should reject an address1 that's too long" do
    long_address = "a" * 61
    long_address_location = Location.new(@attr.merge(:address1 => long_address))
    long_address_location.should_not be_valid
  end

  it "should reject an address2 that's too long" do
    long_address = "a" * 61
    long_address_location = Location.new(@attr.merge(:address2 => long_address))
    long_address_location.should_not be_valid
  end

  it "should require a city" do
    no_city_location = Location.new(@attr.merge(:city => ""))
    no_city_location.should_not be_valid
  end

  it "should reject a city name that's too long" do
    long_city = "a" * 21
    long_city_location = Location.new(@attr.merge(:city => long_city))
    long_city_location.should_not be_valid
  end

  it "should require a state" do
    no_state_location = Location.new(@attr.merge(:state => ""))
    no_state_location.should_not be_valid
  end

  it "should reject a state that's too long" do
    long_state = "a" * 3
    long_state_location = Location.new(@attr.merge(:state => long_state))
    long_state_location.should_not be_valid
  end

  it "should require a zip code" do
    no_zip_location = Location.new(@attr.merge(:zip => ""))
    no_zip_location.should_not be_valid
  end

  it "should reject a zip code that has an invalid format" do
    bad_zips = ["abcde","1234","123456"]
    bad_zips.each do |zip|
      bad_zip_location = Location.new(@attr.merge(:zip => zip))
      bad_zip_location.should_not be_valid
    end
  end

  it "should accept a zip code that has a valid format" do
    good_zips = ["31088","90210","31047"]
    good_zips.each do |zip|
      good_zip_location = Location.new(@attr.merge(:zip => zip))
      good_zip_location.should be_valid
    end
  end 
end
