

=begin
def language(speak)
  if speak == "JavaScript"
    "I like JavaScript"
  when "CSS"
    "I like CSS"
  when "Python"
    "I like Python"
  when "R"
    "I like R"
  when "C++"
    "I like C++"
  when "Unity"
    "I like Unity"
  when "Ruby"
    "I like Ruby"
  when "Ruby on Rails"
    "I like Ruby on Rails"
  when "Java"
    "I like Java"
  else
    "I don't like to code"
  end 
end

#test
p language("JavaScript") == "I like JavaScript"
p language("Unity") == "I like Unity"
p language("Swin") == "I don't like to code"
=end
=begin
def language(speak)
  case speak
  when "JavaScript";like = true
  when "CSS"; like =true
  when "Python"; like =true
  when "R"; like =true
  when "C++"; like =true
  when "Unity"; like =true
  when "Ruby"; like =true
  when "Ruby on Railikes"; like =true
  when "Java"; like =true
  else like =false
  end
  like ? "I like #{speak}" : "I don't like to code"
end
=end
def language(speak); speak == "Swin" ? "I don't like to code" : "I like #{speak}" end
#test
p language("JavaScript") == "I like JavaScript"
p language("Unity") == "I like Unity"
p language("Swin") == "I don't like to code"
