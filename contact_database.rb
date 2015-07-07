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
    count = 0
    csv_file = File.open("contacts.csv", "r")
      while !csv_file.eof?
        line = csv_file.readline #read each line
        array = line.split(%r{,\s*}) #store each line into array
        array.map! { |x| x.chomp } #remove newline char from each element
        puts "#{array[0]}: #{array[1]} (#{array[2]})"
        count += 1
      end
      puts "---"
      puts "#{count} records total"
  end

  def show_contact(id)
    array = []
    not_found = false
    csv_file = File.open("contacts.csv", "r")
      while !csv_file.eof?
        line = csv_file.readline #read each line
        array << line.split(%r{,\s*}) #store each line into array
      end
      array.each do |x| #remove \n from multidimensional array
        x.each do |y|
          y.chomp!
        end
      end
      array.each do |x|
        if x[0].to_i == id
          puts "ID:     #{x[0]}"
          puts "Name:   #{x[1]}"
          puts "Email:  #{x[2]}"
          not_found = false
          break
        else
          not_found = true
        end
      end
      if not_found then puts "Contact not found!" end
  end

  def search_contact(term)
    csv_file = File.open("contacts.csv", "r")
    puts "search term: #{term}"
    while !csv_file.eof?
      line = csv_file.readline #read each line
      if line.match("#{term}")
        puts line
      end
    end

  end

end
