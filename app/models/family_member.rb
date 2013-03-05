class FamilyMember < ActiveRecord::Base
  attr_accessible :birthday, :first_name, :last_name, :relationship, :employee_id

  belongs_to :employee 

  def name
    first_name + " " + last_name
  end
  
  def age
    now = Time.now.utc.to_date
    now.year - birthday.year - (birthday.to_date.change(:year => now.year) > now ? 1 : 0)
  end

  def generation
    if relationship == "Spouse"
      return relationship
    else
      return "Child"
    end
  end

  validates :first_name,    :presence   => true,
                            :length     => {:maximum => 20}

  validates :last_name,     :presence   => true,
                            :length     => {:maximum => 20}

  validates :birthday,      :presence   => true

  validates :relationship,  :presence   => true,
                            :inclusion  => {:in => %w(Spouse Son Daughter)},
                            :uniqueness => {:scope => :employee_id,
                              :message => "We don't condone polygamy."}

  validates :employee_id,   :presence   => true

end
