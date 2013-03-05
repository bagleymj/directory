module FamilyMembersHelper
  def strip_year(input_date)
    return input_date.strftime("%m/%d")
  end
end
