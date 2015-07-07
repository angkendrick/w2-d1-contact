## TODO: Implement CSV reading/writing

require 'csv'

class Database

  def get_index()  
    csv_file = File.open("contacts.csv", "r")
    csv_file.readlines.size + 1 #count number of lines and use as index
  end

  def write_contact(contact_instance, id)

    begin
      csv_writer = File.open("contacts.csv", "a") #write contact to csv file
      csv_writer.puts "#{id}, #{contact.name}, #{contact.email}"
      csv_writer.close
      puts "Contact Saved! Contact ##{id}"
      rescue
        "Failed to write to contacts.csv"
      end
  end

  def read_all_contacts()
    csv_file = File.open("contacts.csv", "r")
      while !csv_file.eof?
        line = csv_file.readline #read each line
        array = line.split(%r{,\s*}) #store each line into array
        array.map! { |x| x.chomp } #remove newline char from each element
        puts "#{array[0]}: #{array[1]} (#{array[2]})"
      end
  end


end
