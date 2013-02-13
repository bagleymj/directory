require 'spec_helper'

describe Employee do
  before { @employee = Employee.new }

  it "should create a new instance of Employee" do
    Employee.new
  end

  subject { @employee }
  it { should respond_to(:name) }
  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:middle_name) }
  it { should respond_to(:address1) }
  it { should respond_to(:address2) }
  it { should respond_to(:city) }
  it { should respond_to(:state) }
  it { should respond_to(:zip) }
  it { should respond_to(:mobile_num) }
  it { should respond_to(:home_num) }
  it { should respond_to(:birthday) }
  it { should respond_to(:location_id) }
end
