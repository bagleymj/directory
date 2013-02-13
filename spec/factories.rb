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
  employee.middle_name  "The"
  employee.last_name    "Employee"
  employee.address1     "122 Main Street"
  employee.address2     ""
  employee.city         "Kathleen"
  employee.state        "GA"
  employee.zip          "31047"
  employee.birthday     '1/21/2010'
  employee.mobile_num   "555-555-5555"
  employee.home_num     "555-555-5555"

end
