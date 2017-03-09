require 'sinatra'

get "/" do
  count_vowels("Cristian")
end

def count_vowels(name)
  vowels = name.scan(/[aeiou]/).count
  puts "My name is #{name} and it has #{vowels} vowels"
end
