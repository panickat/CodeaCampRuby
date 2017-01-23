print "Cual es tu nombre? "
name = gets.chomp
letters=name.length

message = "Welcome #{name}, your name has #{letters} letters"
puts "Welcome #{name}, your name has 7 letters"

if "Welcome #{name}, your name has 7 letters" == message then
 puts true 
  else
    puts false
end

