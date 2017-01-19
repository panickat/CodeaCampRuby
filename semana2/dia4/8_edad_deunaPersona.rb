=begin
Edad De Una Persona

Crea la clase Person y define el método age que llame a un método para calcular la edad de la persona. Es necesario usar un método nativo de ruby que te ayude a obtener el año actual.

#test
p carlos.age == "Carlos is 30 years old."
#=>true
p martha.age == "Martha is 26 years old."
#=>true

p carlos.years_old
#=>private method `years_old'...(NoMethodError)
=end
class Person
  def age; "#{@name} is #{years_old} years old." end
  def years_old; Time.new.year - @birth end

  private
  def initialize(name ="no_name",birth=0)
    @name = name
    @birth = birth
  end
end

carlos = Person.new("Carlos",1987)
martha = Person.new("Martha",1991)
#test
p carlos.age == "Carlos is 30 years old."
#=>true
p martha.age == "Martha is 26 years old."
#=>true

p carlos.years_old
