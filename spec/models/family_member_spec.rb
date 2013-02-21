require 'spec_helper'

describe FamilyMember do
  before(:each) do
    @attr = {
      :first_name => "Little",
      :last_name => "Baby",
      :relationship => "Child",
      :birthday => '2010-10-26',
      :employee_id => 1
    }
    @family_member = FamilyMember.new(@attr)
  end
  subject {@family_member}
  it {should respond_to(:first_name)}
  it {should respond_to(:last_name)}
  it {should respond_to(:birthday)}
  it {should respond_to(:relationship)}
  it {should respond_to(:employee_id)}
  it {should respond_to(:name)}

  it "should require a first name" do
    no_first_name = FamilyMember.new(@attr.merge(:first_name => ""))
    no_first_name.should_not be_valid
  end

  it "should require a last name" do
    no_last_name = FamilyMember.new(@attr.merge(:last_name => ""))
    no_last_name.should_not be_valid
  end

  it "should require a relationship" do
    no_relationship = FamilyMember.new(@attr.merge(:relationship => ""))
    no_relationship.should_not be_valid
  end

  it "should require a birthday" do
    no_birthday = FamilyMember.new(@attr.merge(:birthday => nil))
    no_birthday.should_not be_valid
  end

  it "should belong to an employee" do
    no_owner = FamilyMember.new(@attr.merge(:employee_id => nil))
    no_owner.should_not be_valid
  end

  it "should reject first names that are too long" do
    long_first_name = "a" * 21
    long_first_named_member = FamilyMember.new(@attr.merge(:first_name => long_first_name))
    long_first_named_member.should_not be_valid
  end

  it "should reject last names that are too long" do
    long_last_name = "a" * 21
    long_last_named_member = FamilyMember.new(@attr.merge(:last_name => long_last_name))
    long_last_named_member.should_not be_valid
  end

  it "should reject relationships that are not valid" do
    sketchy_relationships = ["Pet Monkey", "Black Sheep", "Biggest Fan"]
    sketchy_relationships.each do |relationship|
      sketchy_family_member = FamilyMember.new(@attr.merge(:relationship => relationship))
      sketchy_family_member.should_not be_valid
    end
  end

  it "should accept relationships that are valid" do
    normal_relationships = ["Child", "Spouse", "Son", "Daughter", "Husband", "Wife"]
    normal_relationships.each do |relationship|
      normal_family_member = FamilyMember.new(@attr.merge(:relationship => relationship))
      normal_family_member.should be_valid
    end
  end
end
