class Employee < ActiveRecord::Base
  attr_accessible :address1, :address2, :city, :location_id, :state, :zip, :first_name, :last_name, 
    :birthday, :personal_cell, :company_cell, :home_num, :hire_date, :photo, :email, :job_title, :extension

  belongs_to :location
  has_many :family_members

  def name
    first_name + " " + last_name
  end

  def age
    now = Time.now.utc.to_date
    now.year - birthday.year - (birthday.to_date.change(:year => now.year) > now ? 1 : 0)
  end

  def service_time
    now = Time.now.utc.to_date
    now.year - hire_date.year - (hire_date.to_date.change(:year => now.year) > now ? 1 : 0)
  end

  def spouse
    family_members.where(:relationship => "Spouse")
  end

  def children
    family_members.where(:relationship => ["Son", "Daughter"]).order('birthday')
  end

  

  has_attached_file :photo, 
    :styles => { :thumb => "81x108" },
    :default_url => "photo_defaults/default_:style.jpg"

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  zip_regex = /\A\d{5}\z/
  phone_regex = /\A\({0,1}\d{3}[\)\-\.]{0,1}\s{0,1}\d{3}[\-}\.]{0,1}\d{4}\z/

  validates :first_name,    :presence => true,
                            :length   => {:maximum => 20}

  validates :last_name,     :presence => true,
                            :length   => {:maximum => 20}

  validates :email,         :presence => true,
                            :format   => {:with => email_regex}

  validates :location_id,   :presence => true

  validates :job_title,     :presence => true,
                            :length   => {:maximum => 50}

  validates :address1,      :presence => true,
                            :length   => {:maximum => 60}

  validates :address2,      :length   => {:maximum => 60}

  validates :city,          :presence => true,
                            :length   => {:maximum => 20}

  validates :state,         :presence => true,
                            :length   => {:maximum => 2}

  validates :zip,           :presence => true,
                            :format   => { :with => zip_regex }

  validates :birthday,      :presence => true

  validates :hire_date,     :presence => true

  validates :personal_cell,    :format => { :with => phone_regex },
                            :allow_blank => true

  validates :company_cell,    :format => { :with => phone_regex },
                            :allow_blank => true
  
  validates :home_num,      :format => { :with => phone_regex },
                            :allow_blank => true

  validates :extension,     :numericality => true,
                            :allow_blank => true,
                            :length   => {:maximum => 10}

end
