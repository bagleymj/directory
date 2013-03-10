require 'csv'

desc "Import employees from csv file"
task :import => [:environment] do

  file = "db/list.csv"

  @success_rows = 0
  @total_rows = 0

  CSV.foreach(file, :headers => true) do |row|
    @location = check_location


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
  puts "IMPORT COMPLETE! #{@success_rows} of #{@total_rows} rows imported.\n\n"
end

def check_location
  @location_name = row[5].to_s
  @location_array = Location.where(:name => @location_name)
  puts @location_array
  if @location_array.size == 0
    @location_created = false
    until @location_created = true do
      attr = {:name => @location_name}
      puts "Please enter line 1 of the address for #{attr[:name]}:\n"
      get_address1 = gets.chomp
      address1 = {:address1 => get_address1}
      attr.merge!(address1)
      puts "Please enter line 2 of the address for #{attr[:name]} (optional):\n"
      get_address2 = gets.chomp
      address2 = {:address2 => get_address2}
      attr.merge!(address2)
      puts "Please enter the city for #{attr[:name]}:\n"
      get_city = gets.chomp
      city = {:city => get_city}
      attr.merge!(city)
      puts "Please enter the state for #{attr[:name]}:\n"
      get_state = gets.chomp
      state = {:state => get_state}
      attr.merge!(state)
      puts "Please enter the zip code for #{attr[:name]}:\n"
      get_zip = gets.chomp
      zip = {:zip => get_zip}
      attr.merge!(zip)
      #SAVE THE RECORD
      @location = Location.new(attr)
      if @location.save
        puts "LOCATION CREATED"
        @location_created = true
        return @location
      else
        puts "LOCATION ENTRY FAILED"
        @location.errors.full_messages.each do |msg|
          puts msg
        end
      end
    end
  else
    return @location_array[0]
  end
end
