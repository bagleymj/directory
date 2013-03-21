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
      :personal_cell => "444-444-4444",
      :company_cell => "333-333-3333",
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
  it { should_not respond_to(:mobile_num) }
  it { should respond_to(:home_num) }
  it { should respond_to(:birthday) }
  it { should respond_to(:hire_date) }
  it { should respond_to(:location_id) }
  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:extension) }
  it { should respond_to(:job_title) }
  it { should respond_to(:age) }
  it { should respond_to(:service_time) }
  it { should respond_to(:spouse) }
  it { should respond_to(:children) }
  it { should respond_to(:personal_cell) }
  it { should respond_to(:company_cell) }
  it { should respond_to(:password_digest) }

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

  it "should reject email address that are not in the correct format" do
    bad_addresses = ["bagley.com","bongos@vegas", "dudes@castle.brow1"]
    bad_addresses.each do |address|
      bad_address_employee = Employee.new(@attr.merge(:email => address))
      bad_address_employee.should_not be_valid
    end
  end

  describe "employee with duplicate email" do
    before(:each) do
      duplicate_address = Employee.new(@attr)
      duplicate_address.email = @employee.email.upcase
      duplicate_address.save
    end

    it { should_not be_valid }

  end

  it "should accept email addresses that are valid" do
    good_addresses = ["bagleymj@gmail.com","cox@9-pages.co.uk","animal-lover@cox.net"]
    good_addresses.each do |address|
      good_address_employee = Employee.new(@attr.merge(:email => address))
      good_address_employee.should be_valid
    end
  end

  it "should reject zip codes that are not in the correct format" do
    codes = ["310","a1234","123456"]
    codes.each do |code|
      bad_zip = Employee.new(@attr.merge(:zip => code))
      bad_zip.should_not be_valid
    end
  end

  it "should accept zip codes that are in the correct format" do
    codes = ["90210","31088","31029"]
    codes.each do |code|
      good_zip = Employee.new(@attr.merge(:zip => code))
      good_zip.should be_valid
    end
  end

  it "should reject job titles that are too long" do
    long_title = "a" * 51
    long_title_employee = Employee.new(@attr.merge(:job_title => long_title))
    long_title_employee.should_not be_valid
  end

  it "should reject line 1 addresses that are too long" do
    long_address = "a" * 61
    long_address_employee = Employee.new(@attr.merge(:address1 => long_address))
    long_address_employee.should_not be_valid
  end

  it "should reject cities that are too long" do
    long_city = "a" * 21
    long_city_employee = Employee.new(@attr.merge(:city => long_city))
    long_city_employee.should_not be_valid
  end

  it "should reject states that are too long" do
    long_state = "a" * 3
    long_state_employee = Employee.new(@attr.merge(:state => long_state))
    long_state_employee.should_not be_valid
  end

  it "should reject phone numbers that aren't in the right format" do
    bad_numbers = ["911","55555555555","478x361x3592"]
    bad_numbers.each do |number|
      bad_personal_cell = Employee.new(@attr.merge(:personal_cell => number))
      bad_personal_cell.should_not be_valid
      bad_company_cell = Employee.new(@attr.merge(:company_cell => number))
      bad_company_cell.should_not be_valid
      bad_home_num = Employee.new(@attr.merge(:home_num => number))
      bad_home_num.should_not be_valid
    end
  end

  it "should accept phone numbers that are in the right format" do
    good_numbers = ["(478)361-3592","478-542-0315","4783150872"]
    good_numbers.each do |number|
      good_personal_cell = Employee.new(@attr.merge(:personal_cell => number))
      good_personal_cell.should be_valid
      good_company_cell = Employee.new(@attr.merge(:company_cell => number))
      good_company_cell.should be_valid
      good_home_num = Employee.new(@attr.merge(:home_num => number))
      good_home_num.should be_valid
    end
  end

  it "should accept phone numbers that are blank" do
    phoneless_employee = Employee.new(@attr.merge(:personal_cell => "", 
                                                  :company_cell => "", 
                                                  :home_num => ""))
    phoneless_employee.should be_valid
  end

  it "should reject line 2 of addresses that are too long" do
    long_address = "a" * 61
    long_address_employee = Employee.new(@attr.merge(:address2 => long_address))
    long_address_employee.should_not be_valid
  end

  it "should reject extensions that are not numerical" do
    bad_extensions = ["extension","447a","ABCD"]
    bad_extensions.each do |extension|
      bad_extension_employee = Employee.new(@attr.merge(:extension => extension))
      bad_extension_employee.should_not be_valid
    end
  end

  it "should accept extensions that are numerical" do
    good_extensions = ["55555","9876","12345678"]
    good_extensions.each do |extension|
      good_extension_employee = Employee.new(@attr.merge(:extension => extension))
      good_extension_employee.should be_valid
    end
  end

  it "should accept extensions that are blank" do
    blank_extension_employee = Employee.new(@attr.merge(:extension => ""))
    blank_extension_employee.should be_valid
  end

  it "should reject extensions that are too long" do
    long_extension = "123456789123"
    long_extension_employee = Employee.new(@attr.merge(:extension => long_extension))
    long_extension_employee.should_not be_valid
  end

end
