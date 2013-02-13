require 'spec_helper'

describe Location do
  before { @location = Location.new }
  
  subject { @location }

  it "should create a new instance of location" do
    Location.new
  end

  it { should respond_to :name }
  it { should respond_to :address1 }
  it { should respond_to :address2 }
  it { should respond_to :city }
  it { should respond_to :state }
  it { should respond_to :zip }
 
end
