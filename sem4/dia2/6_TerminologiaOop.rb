=begin
Terminología Oop

Programación orientada a objetos (OOP)

Objetivos Académicos
Comprender la terminología de OOP.
Actividades
Para este ejercicio hay que juntarse en equipos.

De los términos siguientes explica en 2 o 3 oraciones cada concepto. Y ejemplifícalo con: dibujos, pseudo-código o código.

Inheritance
Composition
Encapsulation
Duck Typing
The Law of Demeter (ej.)
Overriding Methods (and using super)
Modules
Scope
Private vs Public Methods
Instance vs Class methods and variables
Polymorphism
Separation of Concerns
Recursos Externos
Practical Object Oriented Programming in Ruby (POODR)
=end
#Inheritance Herencia de metodos superclase a subclases con Overriding y metodo Super
puts " ********** ********** ********** Inheritance  ********** ********** ********** "
puts "is used to indicate that one class will get most or all of its features from a parent class. This happens implicitly whenever you write class Foo < Bar, which says 'Make a class Foo that inherits from Bar.' When you do this, the language makes any action that you do on instances of Foo also work as if they were done to an instance of Bar. Doing this lets you put common functionality in the Bar class, then specialize that functionality in the Foo class as needed."
class Parent
  def implicit()
    puts "PARENT implicit()"
  end
end
class Child < Parent
end
dad = Parent.new()
son = Child.new()
dad.implicit()
son.implicit()

puts " ********** ********** **********  Composition  ********** ********** ********** "
puts "Inheritance is useful, but another way to do the exact same thing is just to use other classes and modules, rather than rely on implicit inheritance. If you look at the three ways to exploit inheritance, two of the three involve writing new code to replace or alter functionality. This can easily be replicated by just calling functions in a module. Here's an example of doing this:"
class Other
  def override()
    puts "OTHER override()"
  end
  def implicit()
    puts "OTHER implicit()"
  end
  def altered()
    puts "OTHER altered()"
  end
end
class Child
  def initialize()
    @other = Other.new()
  end
  def implicit()
    @other.implicit()
  end
  def override()
    puts "CHILD override()"
  end
  def altered()
    puts "CHILD, BEFORE OTHER altered()"
    @other.altered()
    puts "CHILD, AFTER OTHER altered()"
  end
end
son = Child.new()
son.implicit()
son.override()
son.altered()

puts " ********** ********** ********** Encapsulation ********** ********** **********"
puts "Encapsulation is the packing of data and functions into a single component.
Encapsulation means that the internal representation of an object is hidden from the outside. Only the object can interact with its internal data. Public methods can be created to open a defined way to access the logic inside an object.
Encapsulation reduce system complexity and increase robustness by decoupling its components."
class Document
  attr_accessor :name
  def initialize(name)
    @name = name
  end
  def set_name(name)
    @name = name
  end
end
d = Document.new('name1')
p d.set_name('name1')

puts " ********** ********** ********** Duck Typing ********** ********** ********** "
puts "You'll have noticed that in Ruby we don't declare the types of variables, In Ruby, we rely less on the type (or class) of an object and more on its capabilities. If walk eat and sounds like duck its a duck!"

puts " ********** ********** ********** Demeter Law ********** ********** ********** "
puts "Your method can call other methods in its class directly.
Your method can call methods on its own fields directly (but not on the fields’ fields).
When your method takes parameters, your method can call methods on those parameters directly.
When your method creates local objects, that method can call methods on the local objects."
puts ""
puts "You can play with yourself.
You can play with your own toys (but you can’t take them apart),
You can play with toys that were given to you.
And you can play with toys you’ve made yourself."

puts " ********** ********** ********** Overriding ********** ********** ********** "
puts "The problem with having functions called implicitly is sometimes you want the child to behave differently. In this case you want to override the function in the child, effectively replacing the functionality. To do this just define a function with the same name in Child. Here's an example:"
class Parent
  def override()
    puts "PARENT override()"
  end
end
class Child < Parent
  def override()
    puts "CHILD override()"
  end
end
dad = Parent.new()
son = Child.new()
dad.override()
son.override()

puts "override Super"
class Parent
  def altered()
    puts "PARENT altered()"
  end
end

class Child < Parent
  def altered()
    puts "CHILD, BEFORE PARENT altered()"
    super()
    puts "CHILD, AFTER PARENT altered()"
  end

end

dad = Parent.new()
son = Child.new()

dad.altered()
son.altered()

puts " ********** ********** ********** Modules ********** ********** ********** "
puts "Ruby has another way to do composition using modules and a concept called mixins. You simply create a module with functions that are common to classes and then include them in your class similar to using a require. Here's this same composition example done using modules and mixins."
module Mod
  include Math
  CONST = 1
  def meth
    #  ...
  end
end
p Mod.class              #=> Module
p Mod.constants          #=> [:CONST, :PI, :E]
p Mod.instance_methods   #=> [:meth]

puts " ********** ********** ********** Scope ********** ********** ********** "
puts "Ruby Variable Scope: A Quick Reference
Ruby has variables defined within different scopes, which you probably know already. I found that most tutorials describe them briefly (the variable types), but they fail to mention precisely what their scope is. Here are the details:

Class variable (@@a_variable): Available from the class definition and any sub-classes. Not available from anywhere outside.
Instance variable (@a_variable): Available only within a specific object, across all methods in a class instance. Not available directly from class definitions.
Global variable ($a_variable): Available everywhere within your Ruby script.
Local variable (a_variable): It depends on the scope. You’ll be working with these most and thus encounter the most problems, because their scope depends on various things."

puts "El uso de métodos privados y públicos nos ayuda a implementar la encapsulación en la programación orientada a objetos. Los métodos privados solamente están disponibles dentro de la clase donde fueron definidos. Los métodos públicos están disponibles para cualquier clase, incluso desde afuera de la clase donde fueron creados.

Los métodos de instancia sólo están disponibles para la instancia de una clase. Los métodos de clase pueden ser usados con sólo el nombre de la clase (no se necesitan instancias).

La palabra polimorfismo quiere decir muchas formas. En programación orientada a objetos, el polimorfismo quiere decir que una entidad (como una variable o un método), puede tener múltiples formas. una variable con el mismo nombre puede responder a diferentes métodos dependiendo de cómo se llame dicha variable.

Separation of Concerns quiere decir que cada parte de un programa ejecuta una tarea específica y única, para manejar mejor su estructura, encapsulando la información y así facilitar el manejo de información."
