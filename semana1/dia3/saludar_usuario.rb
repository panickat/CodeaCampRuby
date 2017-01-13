def say_hi(name)
  case name
  when "Daniel"
    return "Welcome back"
  else
    return "Hi, #{name}" 
  end
end

# Pruebas
p say_hi('Daniel') == "Welcome back"
p say_hi('Juan') == "Hi, Juan"