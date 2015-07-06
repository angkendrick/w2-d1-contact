class Contact
 
  attr_accessor :name, :email
 
  def initialize(name, email)
    # TODO: assign local variables to instance variables
    @name = name
    @email = email

  end
 
  def to_s
    # TODO: return string representation of Contact
  end
 
  ## Class Methods
  class << self
    def create(name, email)
      # TODO: Will initialize a contact as well as add it to the list of contacts
      contact = Contact.new(name, email) #initialize contact

      csv_file = File.open("contacts.csv", "r")
      id = csv_file.readlines.size + 1 #count number of lines and use as index

      begin
      csv_writer = File.open("contacts.csv", "a") #write contact to csv file
      csv_writer.puts "#{id}, #{contact.name}, #{contact.email}"
      csv_writer.close
      puts "Contact Saved! Contact ##{id}"
      rescue
        "Failed to write to contacts.csv"
      end

    end
 
    def find(term)
      # TODO: Will find and return contacts that contain the term in the first name, last name or email
    end
 
    def all
      # TODO: Return the list of contacts, as is
      csv_file = File.open("contacts.csv", "r")
      while !csv_file.eof?
        line = csv_file.readline #read each line
        array = line.split(%r{,\s*}) #store each line into array
        array.map! { |x| x.chomp } #remove newline char from each element
        puts "#{array[0]}: #{array[1]} (#{array[2]})"
      end

    end
    
    def show(id)
      # TODO: Show a contact, based on ID
    end
    
  end
 
end