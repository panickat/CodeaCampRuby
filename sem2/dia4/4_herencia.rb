=begin
Herencia

Crea las siguientes clases: Animal, Dog, Turtle, Macaw, Fish, Dolphin, Reptile, Cat, Whale, Snake, Mammal, Bird. El objetivo de este ejercicio es relacionar todas estas clases con herencia, de tal manera de colocar los comportamientos correctos en las clases correctas.

Define un comportamiento común que pueda ser heredado por todas las clases. Crea una constante en las clases Dog, Turtle, Macaw, Fish, Dolphin, Cat, Whale y Snake que guarde información de estas clases y las diferencie de las demás. Al final muestra la información de estas constantes a través de comportamientos definidos de cada clase.

Hay que crear las pruebas correspondientes. Recuerda que las pruebas deben regresar true.

class Animal

end

class Dog

end

class Turtle

end

class Macaw

end

class Fish
  def swim
  end
end

class Dolphin

end

class Reptile
  def has_scales?
  end
end

class Cat

end

class Whale

end

class Snake

end

class Mammal
  def warm_blooded?
  end
end

class Bird

end

#test
#Aquí deben ir las pruebas correspondientes
=end
=begin
#modo 1
class Animal
  attr_accessor :name #Define un comportamiento común que pueda ser heredado por todas las clases
  def initialize(name = "no_name")
    @name = name
  end
end

class Animal_class < Animal
  def has_scales?; false end
  def have_fangs?; false end
  def can_fly?; false end
end

class Reptile < Animal_class
  def has_scales?; true end
end
class Mammal < Animal_class
  def have_fangs?; true end
end
class Bird < Animal_class
  def can_fly?; true end
end

class Dog < Mammal
  def barks?; true end
end
class Turtle < Reptile
  def has_shell?; true end
end
class Macaw < Bird
  def has_peak?; true end
end
class Fish
  def can_swim?; true end
end
class Dolphin
  def can_swim?; true end
end
class Cat < Mammal
  def can_meow?; true end
end
class Whale
  def can_swim?; true end
end
class Snake < Reptile
  def can_crawl?; true end
end

#test
Kero = Dog.new
Juaquin = Macaw.new
Jess = Snake.new

p Kero.have_fangs? == true
p Juaquin.have_fangs? == false
p Jess.have_fangs? == false

p Kero.can_fly? == false
p Juaquin.can_fly? == true
p Jess.can_fly? == false
=end
class Animal
  attr_accessor :name #Define un comportamiento común que pueda ser heredado por todas las clases
  def initialize(name = "no_name")
    @name = name
  end
end

class Reptile < Animal
  def has_scales?; false end
end
class Mammal < Animal
  def have_fangs?; false end
end
class Bird < Animal
  def can_fly?; false end
end

class Dog < Animal
  def have_fangs?; true end
end
class Turtle < Animal
  def has_scales?; true end
end
class Macaw < Animal
  def can_fly?; true end
end
class Fish < Animal
  def can_swim?; true end
end
class Dolphin < Animal
  def can_swim?; true end
end
class Cat < Animal
  def have_fangs?; true end
end
class Whale < Animal
  def can_swim?; true end
end
class Snake < Animal
  def has_scales?; true end
end

#test
Kero = Dog.new
Juaquin = Macaw.new
Jess = Snake.new

p Kero.have_fangs? == true
p Juaquin.can_fly? == true
p Jess.has_scales? == true
