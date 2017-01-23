=begin
Clase Computer

Crea la clase Computer y agrega un método para cambiar y ver el color de la computadora.

#test
mac.color = "Platinum"
p mac.color
#=>"Platinum"
=end
class Computer
  attr_accessor :color

  def initialize(color="no_color")
    @color = color
  end
end

mac = Computer.new

#test
mac.color = "Platinum"
p mac.color
#=>"Platinum"
