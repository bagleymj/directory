require 'csv'

desc "Import employees from csv file"
task :import => [:environment] do

  file = "db/list.csv"

  @success_rows = 0
  @total_rows = 0

  CSV.foreach(file, :headers => true) do |row|
    @employee = Employee.new(
      :first_name => row[0].to_s,
      :last_name => row[1].to_s,
      :birthday => row[2],
      :job_title => row[4].to_s,
      :location_id => row[5].to_i,
      :address1 => row[6].to_s,
      :address2 => row[7].to_s,
      :city => row[8].to_s,
      :state => row[9].to_s,
      :zip => row[10].to_s,
      :hire_date => row[11],
      :home_num => row[12].to_s,
      :extension => row[13].to_s,
      :email => row[14].to_s.downcase
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
