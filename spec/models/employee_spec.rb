require 'spec_helper'

describe Employee do
  before(:each) do
    @attr = {
      :first_name => "Fake",
      :last_name => "CoWorker",
      :email => "notreal@imaginary.com",
      :location_id => 1,
      :job_title => "Secret Agent",
      :address1 => "123 Main Street",
      :address2 => "",
      :city => "Atlanta",
      :state => "GA",
      :zip => "54321",
      :home_num => "555-555-5555",
      :mobile_num => "444-444-4444",
      :extension => "1234",
      :birthday => '1983-6-21',
      :hire_date => '2005-1-1'
    }
    @employee = Employee.new(@attr)
  end
  subject { @employee }
  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:address1) }
  it { should respond_to(:address2) }
  it { should respond_to(:city) }
  it { should respond_to(:state) }
  it { should respond_to(:zip) }
  it { should respond_to(:mobile_num) }
  it { should respond_to(:home_num) }
  it { should respond_to(:birthday) }
  it { should respond_to(:hire_date) }
  it { should respond_to(:location_id) }
  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:extension) }
  it { should respond_to(:job_title) }

  it "should create a new Employee, given valid attributes" do
    Employee.create!(@attr)
  end

  it "should require a first name" do
    first_nameless = Employee.new(@attr.merge(:first_name => ""))
    first_nameless.should_not be_valid
  end

  it "should require a last name" do
    last_nameless = Employee.new(@attr.merge(:last_name => ""))
    last_nameless.should_not be_valid
  end
  

  it "should require a location_id" do
    locationless = Employee.new(@attr.merge(:location_id => nil))
    locationless.should_not be_valid
  end

  it "should require a job title" do
    titleless = Employee.new(@attr.merge(:job_title => ""))
    titleless.should_not be_valid
  end

  it "should require the first line of an address" do
    homeless = Employee.new(@attr.merge(:address1 => ""))
    homeless.should_not be_valid
  end

  it "should require a city" do
    cityless = Employee.new(@attr.merge(:city => ""))
    cityless.should_not be_valid
  end

  it "should require a state" do
    stateless = Employee.new(@attr.merge(:state => ""))
    stateless.should_not be_valid
  end

  it "should require a zip code" do
    zipless = Employee.new(@attr.merge(:zip => ""))
    zipless.should_not be_valid
  end

  it "should require a birthday" do
    unborn = Employee.new(@attr.merge(:birthday => nil))
    unborn.should_not be_valid
  end

  it "should require a hire date" do
    unemployed = Employee.new(@attr.merge(:hire_date => nil))
    unemployed.should_not be_valid
  end

  it "should reject first names that are too long" do
    long_first_name = "a" * 21
    long_first_named_employee = Employee.new(@attr.merge(:first_name => long_first_name))
    long_first_named_employee.should_not be_valid
  end

  it "should reject last names that are too long" do
    long_last_name = "b" * 21
    long_last_named_employee = Employee.new(@attr.merge(:last_name => long_last_name))
    long_last_named_employee.should_not be_valid
  end

  it "should reject zip codes that are not in the correct format" do
    codes = ["310","a1234","123456"]
    codes.each do |code|
      bad_zip = Employee.new(@attr.merge(:zip => code))
      bad_zip.should_not be_valid
    end
  end

end
