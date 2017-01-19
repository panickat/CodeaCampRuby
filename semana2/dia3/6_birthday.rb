=begin
Birthday

Modifica el código de la clase Person y también el código que necesites cambiar de las pruebas, excepto las partes indicadas que no deben modificarse. Haz pasar las pruebas correspondientes.

class Person
  attr_accessor :age

  #no modificar este método de clase
  def self.birthday
    @@age += 1
  end
end

alice = Person.new

#test
alice.age = 17
p alice.age == 17
#=> true
alice.@age
p alice.birthday == 18
#=> true
=end
class Person
  @@age = 0
  attr_accessor :age

  #no modificar este método de clase
  def self.birthday
    @@age += 1
  end

  def birthday
    @age += 1
  end
end

alice = Person.new

#test
alice.age = 17
p alice.age == 17
#=> true

p alice.birthday == 18
#=> true
