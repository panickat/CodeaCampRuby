=begin
Variables De Clase

Agrega una variable de clase a la superclase Vehicle que pueda darle seguimiento al número de objetos creados que heredan de la superclase. También crea un método que imprima el valor de esta variable de clase.

class Vehicle

end

class Car < Vehicle

end

class Bus < Vehicle

end

#test
car_1 = Car.new
car_2 = Car.new
bus_1 = Bus.new

p Car.number_of_vehicles == "This Superclass has created 3 vehicles"
# => true
=end
class Vehicle
  @@Instances = 0

  def initialize
    @@Instances += 1
  end
  def self.number_of_vehicles
    "This Superclass has created #{@@Instances} vehicles"
  end
end

class Car < Vehicle; end
class Bus < Vehicle; end

#test
car_1 = Car.new
car_2 = Car.new
bus_1 = Bus.new

p Car.number_of_vehicles == "This Superclass has created 3 vehicles"
# => true
