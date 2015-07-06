require_relative 'contact'
require_relative 'contact_database'
 
# TODO: Implement command line interaction
# This should be the only file where you use puts and gets



user_input = ARGV[0]

def help()

  puts "new - Create a new contact"
  puts "list - List all contacts"
  puts "show - Show a contact"
  puts "find - Find a contact"

end

case user_input

when "help"
  help()
when "new"
  puts "Please enter contact name"
  name = STDIN.gets.chomp()
  puts "Please enter contact email address"
  email = STDIN.gets.chomp()
  contact = Contact.create(name, email)
when "list"
  Contact.all()

end

