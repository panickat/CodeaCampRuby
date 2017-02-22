 require_relative 'app'

def assert(truthy, testname)
  puts "     ***** **** *** ** * #{testname} * ** *** **** *****     "
  raise "Tests failed" unless truthy
  puts "test ok!"
  puts " "
rescue
  puts "test fail!"
  puts " "
end

assert Chef.create(first_name: "Cris", last_name: "Arce", email:"krizkrag@gmail.com",
phone:"5541920118", birthday: Date.new(1982,02,02)).class == Chef, "create & insert! Chef"

assert Chef.find(21)[:first_name] == 'Cris', "Chef.find first_name Cris && metodo []"
assert Chef.all.count > 0, "Chef.all count > 0"
assert Chef.where('first_name = ?',"Cris").first[:first_name] == "Cris", "Chef.where first_name = Cris"

chef_jon = Chef.where('first_name = ?',"Cris").last
chef_jon[:first_name] = "Jon"
chef_jon.save
assert Chef.where('first_name = ?',"Jon").first[:first_name] == "Jon", "Chef.update! first_name = Jon && metodo []="

assert Chef.new(first_name: "Cris", last_name: "Arce", email:"krizkrag@gmail.com",
phone:"5541920118", birthday: Date.new(1982,02,02)).class == Chef, "create & insert! Chef"
