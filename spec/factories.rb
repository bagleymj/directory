Factory.define :location do |location|
  location.name     "Test Location"
  location.address1 "124 Main Street"
  location.address2 ""
  location.city     "Kathleen"
  location.state    "GA"
  location.zip      "31047"
end

Factory.define :employee do |employee|
  employee.first_name   "Test"
  employee.last_name    "Employee"
  employee.address1     "122 Main Street"
  employee.address2     ""
  employee.city         "Kathleen"
  employee.state        "GA"
  employee.zip          "31047"
  employee.birthday     '1/21/2010'
  employee.mobile_num   "555-555-5555"
  employee.home_num     "555-555-5555"
  employee.location_id  1
  employee.email        "employee@email.com"
  employee.extension    "1234"
  employee.job_title    "Sales"
end

Factory.define :family_member do |family_member|
  family_member.first_name    "Test"
  family_member.last_name     "Wife"
  family_member.birthday      '1/1/1983'
  family_member.employee_id   1
  family_member.relationship  "Spouse"
end
