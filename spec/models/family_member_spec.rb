require 'spec_helper'

describe FamilyMember do
  before {@family_member = FamilyMember.new}
  subject {@family_member}
  it {should respond_to(:first_name)}
  it {should respond_to(:last_name)}
  it {should respond_to(:birthday)}
  it {should respond_to(:relationship)}
  it {should respond_to(:employee_id)}
  it {should respond_to(:name)}

end
