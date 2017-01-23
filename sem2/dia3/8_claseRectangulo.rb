=begin
Clase Rectángulo

Crea los siguientes métodos dentro de la clase Rectangle:

class Rectangle
  attr_accessor :width, :height

  def initialize(width, height)
    @width = width
    @height = height
  end
end
Rectangle#area, regresa el área del rectángulo.
Rectangle#perimeter, regresa el perímetro del rectángulo.
Rectangle#diagonal, regresa el tamaño de la diagonal del rectángulo como Float.
Rectangle#square?, regresa true si el rectángulo es un cuadrado.
# Pruebas

rectangle = Rectangle.new(20, 10)
puts rectangle.area == 200
puts rectangle.perimeter == 60
puts rectangle.diagonal == 22.360679774997898
puts rectangle.square? == false

rectangle2 = Rectangle.new(10, 10)
puts rectangle2.area == 100
puts rectangle2.perimeter == 40
puts rectangle2.diagonal == 14.142135623730951
puts rectangle2.square? == true
=end

class Rectangle
  attr_accessor :width, :height

  def initialize(width, height)
    @width = width
    @height = height
  end

  def area;  @width * @height end
  def perimeter;  (@width * 2) + (@height * 2) end
  def diagonal; Math.hypot(@width,@height) end
  def square?; @width == @height ? true : false end
end

# Pruebas
rectangle = Rectangle.new(20, 10)
puts rectangle.area == 200
puts rectangle.perimeter == 60
puts rectangle.diagonal == 22.360679774997898
puts rectangle.square? == false

rectangle2 = Rectangle.new(10, 10)
puts rectangle2.area == 100
puts rectangle2.perimeter == 40
puts rectangle2.diagonal == 14.142135623730951
puts rectangle2.square? == true
