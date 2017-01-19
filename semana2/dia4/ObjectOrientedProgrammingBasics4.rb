=begin
Ruby: Object Oriented Programming Basics 4

Herencia
Herencia es cuando una clase hereda un comportamiento desde otra clase. La clase que está heredando comportamiento se le denomina subclase y la clase que le hereda ese comportamiento se llama superclase.

Una ventaja de la herencia es que las clases que en una jerarquía están en un nivel inferior, heredan las características de las clases de niveles superiores; y además, pueden añadir sus propias características.

Por ejemplo, todos los gatos y perros son mamíferos. Si todos los mamíferos respiran, la clase gato y la clase perro heredan de la clase mamífero esta característica de respirar...
=end
# superclase

class Mammal
  def breath
    puts 'inspirar, espirar'
  end
end

# el símbolo < indica que 'Cat' es una subclase de Mammal

class Cat < Mammal
  def meow
    puts 'Miaaaaaaaaaaau'
  end
end

# el símbolo < indica que 'Dog' es una subclase de Mammal

class Dog < Mammal
  def bark
    puts 'Guauu Guauu'
  end
end

catty = Cat.new
doggy = Dog.new
catty.breath
catty.meow
doggy.breath
doggy.bark
=begin
En el ejemplo anterior podemos ver otra ventaja de la herencia, que es el poder extraer comportamientos comunes (breath) desde clases que comparten ese comportamiento (Cat y Dog) y moverlo a una superclase (Mammal). Esta es una manera de mantener la lógica en un sólo lugar.

Super
El método super nos permite llamar métodos de la jerarquía de herencia. Cuando se llama super desde un método, busca la jerarquía de herencia para un método con el mismo nombre y lo invoca.
=end
class People
  def greeting
    "Hello!"
  end
end

class Women < People
  def greeting
    super + " from People class"
  end
end


wendy = Women.new
p wendy.greeting
#=> "Hello! from People class"
