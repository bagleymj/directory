require 'csv'

desc "Import employees from csv file"
task :import => [:environment] do

  file = "db/list.csv"

  reset_counts

  CSV.foreach(file, :headers => true) do |row|
    @location_name = row[5].to_s
    location_array = Location.where(:name => @location_name)
    if location_array.empty?
      puts "#{@location_name} not found. Let's create it.\n\n"
      @location_created = false
      until @location_created == true do
        attr = {:name => @location_name}
        puts "Please enter line 1 of the address for #{attr[:name]}:\n\n"
        get_address1 = STDIN.gets.chomp
        address1 = {:address1 => get_address1}
        attr.merge!(address1)
        puts "Please enter line 2 of the address for #{attr[:name]} (optional):\n\n"
        get_address2 = STDIN.gets.chomp
        address2 = {:address2 => get_address2}
        attr.merge!(address2)
        puts "Please enter the city for #{attr[:name]}:\n\n"
        get_city = STDIN.gets.chomp
        city = {:city => get_city}
        attr.merge!(city)
        puts "Please enter the state for #{attr[:name]}:\n\n"
        get_state = STDIN.gets.chomp
        state = {:state => get_state}
        attr.merge!(state)
        puts "Please enter the zip code for #{attr[:name]}:\n\n"
        get_zip = STDIN.gets.chomp
        zip = {:zip => get_zip}
        attr.merge!(zip)
        #SAVE THE RECORD
        @location = Location.new(attr)
        if @location.save
          puts "LOCATION CREATED\n\n"
          @location_created = true
        else
          puts "LOCATION ENTRY FAILED"
          @location.errors.full_messages.each do |msg|
            puts msg
          end
          puts "\n\n"
        end
      end
    end
  end

  CSV.foreach(file, :headers => true) do |row|
    @location_array = Location.where( :name => row[5].to_s )
    @location = @location_array[0]
    @location_id = @location.id

    @employee = Employee.new(
      :first_name => row[0].to_s,
      :last_name => row[1].to_s,
      :birthday => row[2],
      :job_title => row[4].to_s,
      :location_id => @location_id,
      :address1 => row[6].to_s,
      :address2 => row[7].to_s,
      :city => row[8].to_s,
      :state => row[9].to_s,
      :zip => row[10].to_s,
      :hire_date => row[11],
      :home_num => row[12].to_s,
      :company_cell => row[13].to_s,
      :personal_cell => row[14].to_s,
      :extension => row[16].to_s,
      :email => row[17].to_s.downcase
    )
    if @employee.save
      @success_rows += 1
    else
      puts ("\n" + @employee.first_name + " " + @employee.last_name + " import failed: ").upcase
      @employee.errors.full_messages.each do |msg|
        puts msg
      end
      puts "\n"
    end
    @total_rows += 1
  end

  puts "Employee Import COMPLETE! #{@success_rows} of #{@total_rows} rows imported.\n\n"

  #Import Family Members
  puts "Importing Family Members.\n\n"

  reset_counts

  CSV.foreach(file, :headers => true) do |row|
    employee_array = Employee.where(:email => row[17].to_s.downcase)
    @employee = employee_array[0]
    @next_child = 21
    unless row[18].blank? || employee_array.empty?
      @spouse = FamilyMember.new(
        :first_name => row[18].to_s,
        :last_name => row[19].to_s,
        :birthday => row[20],
        :relationship => "Spouse",
        :employee_id => @employee.id )
      if @spouse.save
        @success_rows += 1
      else
        puts "Import Failed. #{@employee.first_name} #{@employee.last_name}'s spouse not saved:"
        @spouse.errors.full_messages.each do |msg|
          puts msg
        end
      end
      @total_rows += 1
    end
    until row[@next_child].blank? || employee_array.empty?
      if row[@next_child + 3].to_s == "Male"
        @relationship = "Son"
      else
        @relationship = "Daughter"
      end
      @child = FamilyMember.new(
        :first_name => row[@next_child].to_s,
        :last_name => row[@next_child + 1].to_s,
        :birthday => row[@next_child + 2],
        :relationship => @relationship,
        :employee_id => @employee.id
      )
      if @child.save
        @success_rows += 1
      else
        puts "Import Failed. #{@employee.first_name} #{@employee.last_name}'s child not saved:"
        @child.errors.full_messages.each do |msg|
          puts msg
        end
        puts "\n\n"
      end
      @total_rows += 1
      @next_child += 4
    end
  end

  puts "FAMILY MEMBER IMPORT COMPLETE: #{@success_rows} of #{@total_rows} imported successfully.\n\n\n"
  puts "It was a wild ride, but I think we're done."
end

def reset_counts
  @success_rows = 0
  @total_rows = 0
end




