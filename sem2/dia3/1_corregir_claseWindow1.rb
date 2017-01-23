=begin
Corregir El Código De La Clase Window 1

Corrige el código de la clase Window. Haz pasar las pruebas. No modifiques las pruebas.

class Window
  attr_writer :color
  attr_reader :size

  def initialize
  end

  def open
    puts "open window"
  end

  def close
    puts "close window"
  end
end

#test
p window_1.color == "green"
window_1.size = 5
p window_1.open == "open green window"
p window_1.close == "close window of 5 meters"
=end

class Window
  attr_reader :color
  attr_writer :size

  def initialize(color="no_color",size=0)
    @color = color
    @size = size
  end

  def open
    "open #{@color} window"
  end

  def close
    "close window of #{@size} meters"
  end
end
window_1 = Window.new("green",5)

#test
p window_1.color == "green"
window_1.size = 5
p window_1.open == "open green window"
p window_1.close == "close window of 5 meters"