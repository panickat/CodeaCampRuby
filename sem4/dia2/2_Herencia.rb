=begin
Herencia

¿Has visto a un chango? ¿Tiene algún parecido contigo? La herencia en programación es muy similar a la herencia en la realidad.

La herencia es un de las características más importantes de los lenguajes orientados a objetos. Ayuda a no repetir código (DRY). Cuando tienes clases semejantes te permite compartir propiedades y comportamiento basado en una relación jerárquica.

Definiciones

En este ejemplo:

Vehicle es Superclass de Bike.
Bike es Subclass de Vehicle.
La herencia en Ruby funciona de la siguiente manera:

class Vehicle
  def has_wheels?
    true
  end
end

class Bike < Vehicle
end

bike = Bike.new
puts bike.has_wheels?
=> true
Recursos externos
Programming Ruby (a.k.a. the Pickaxe):
Inheritance in Ruby
Objetivos Académicos
Comprender el concepto de herencia
Crear relaciones de herencia entre clases
Actividades
Fíjate en las siguientes clases, trata de relacionarlas y crea los métodos para hacer pasar el driver code. Pon antención en el método que te pedimos en la clase 'Vehicle' el cual hará uso de la "Self keyword" que vimos anteriormente.

class Vehicle

  def what_am_i?
    # Este método va a ser utilizado por varias clases y deberá regresar
    # el nombre de la clase desde la cual se corrió.
    # ej.
    # bocho = Car.new
    # bocho.what_am_i? => Car
  end
end

class Motorized
end

class Motorbike
end

class Car
end

class Bicycle
end

class Skateboard
end

moto = Motorbike.new
car = Car.new
bike = Bicycle.new(8)
skateboard = Skateboard.new

vehicles = [moto, car, bike, skateboard]


vehicles.each do |vehicle|
  vehicle.age!
  puts "#{vehicle.what_am_i?} responds to:"
  puts "\tNumber of wheels: #{vehicle.respond_to?(:number_of_wheels) == true}"
  puts "\tColor: #{vehicle.respond_to?(:color) == true}"
  puts "\tAge!: #{vehicle.respond_to?(:age!) == true}"
  puts "\tHas motor: #{vehicle.respond_to?(:has_motor) == true}"
  puts "\tTank size: #{vehicle.respond_to?(:tank_size) == true}"
  puts "\tRefuel: #{vehicle.respond_to?(:refuel) == true}"
  puts "\tNumber of gears: #{vehicle.respond_to?(:number_of_gears) == true}"
  puts "\tAge: #{vehicle.age}"
  puts "\n\n"
end
=end
class Vehicle

  def what_am_i?
    # Este método va a ser utilizado por varias clases y deberá regresar
    # el nombre de la clase desde la cual se corrió.
    # ej.
    # bocho = Car.new
    # bocho.what_am_i? => Car
    self.class
  end
  def initialize
    @age = 0
  end
  attr_reader :number_of_wheels, :color, :age, :has_motor, :tank_size, :refuel, :number_of_gears
  def age!
    @age += 1000
  end
end

class Motorized < Vehicle
end

class Motorbike < Vehicle
end

class Car < Vehicle
end

class Bicycle < Vehicle
  def initialize(arg)
    @age = 1_000_000
  end
end

class Skateboard < Vehicle
end

moto = Motorbike.new
car = Car.new
bike = Bicycle.new(8)
skateboard = Skateboard.new

vehicles = [moto, car, bike, skateboard]


vehicles.each do |vehicle|
  vehicle.age!
  puts "#{vehicle.what_am_i?} responds to:"
  puts "\tNumber of wheels: #{vehicle.respond_to?(:number_of_wheels) == true}"
  puts "\tColor: #{vehicle.respond_to?(:color) == true}"
  puts "\tAge!: #{vehicle.respond_to?(:age!) == true}"
  puts "\tHas motor: #{vehicle.respond_to?(:has_motor) == true}"
  puts "\tTank size: #{vehicle.respond_to?(:tank_size) == true}"
  puts "\tRefuel: #{vehicle.respond_to?(:refuel) == true}"
  puts "\tNumber of gears: #{vehicle.respond_to?(:number_of_gears) == true}"
  puts "\tAge: #{vehicle.age}"
  puts "\n\n"
end
