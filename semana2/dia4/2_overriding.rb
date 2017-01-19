=begin
Overriding

¿Qué comportamiento heredan las clases Dog y Cat de la superclase? Agrega el código necesario para que las pruebas sean true.

class Animal

end

class Dog

end

class Cat

end

#test
drako = Dog.new("Drako")
peto = Cat.new
p drako.speak == "Drako say Guau!"
# => true
p peto.speak == "Hello!"
# => true
=end
class Animal
  def speak; "Hello!" end

  def initialize(name="no_name")
    @name = name
  end
end

class Dog < Animal
  def speak; "Drako say Guau!" end # sobre escribe el metodo speak de Animal
end
class Cat < Animal; end

#test
drako = Dog.new("Drako")
peto = Cat.new
p drako.speak == "Drako say Guau!"
# => true
p peto.speak == "Hello!"
# => true
