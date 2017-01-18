class RaceCar
  #variable de clase
  @@number_of_cars = 0

  def initialize
    @@number_of_cars += 1
  end

  def self.number_of_cars
    @@number_of_cars
  end

end

p RaceCar.number_of_cars
#=>0

race_car1 = RaceCar.new

p RaceCar.number_of_cars
#=>1

race_car2 = RaceCar.new
race_car3 = RaceCar.new
race_car4 = RaceCar.new

p RaceCar.number_of_cars