=begin
Super Super Super

Agrega el código necesario en la superclase y en las subclases para hacer pasar las pruebas correspondientes. Revisa documentación acerca del uso de super.

class People

  def initialize
  end
end

class Man < People

  def initialize
  end
end

class Woman < People

end

#test
man = Man.new("brown")
woman = Woman.new("leyla")
p man.name == "brown"
#=>true
p man.color == "brown"
#=>true
p man.color = "red"
#=>...undefined method `color='...
p woman.name == "leyla"
#=>true
woman.name = "Karla"
p woman.name == "Karla"
#=>true
p woman.color == "leyla"
#=>...undefined method `color'...
=end
class People
  attr_accessor :name
  def initialize(name="no_name",color="brown")
    @name = name
    @color = color
  end

  def color; @color end
  def name; @name end
end

class Man < People
  def color; super end
end
class Woman < People
  def name; super end
end

#test
man = Man.new("brown")
woman = Woman.new("leyla")
p man.name == "brown"
#=>true
p man.color == "brown"
#=>true
p man.color = "red"
#=>...undefined method `color='...
p woman.name == "leyla"
#=>true
woman.name = "Karla"
p woman.name == "Karla"
#=>true
p woman.color == "leyla"
#=>...undefined method `color'...
