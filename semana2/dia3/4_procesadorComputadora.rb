=begin
¿Qué Procesador Tiene La Computadora?

Crea la clase "Computer" y agrega un método que permita solamente ver y no modificar el procesador de la computadora.

#test
mac.processor
#=>"Intel"
mac.processor = "AMD"
#=>...undefined method `processor='...
=end
class Computer
  def processor
    "Intel"
  end
end

mac = Computer.new
#test
p mac.processor
#=>"Intel"
mac.processor = "AMD"
#=>...undefined method `processor='...
