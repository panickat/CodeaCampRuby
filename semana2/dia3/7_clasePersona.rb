=begin
Clase Persona

Crea los siguientes métodos dentro de la clase Person:

class Person
  attr_accessor :first_name, :last_name, :email

  def initialize(first_name, last_name, email)
    @first_name = first_name
    @last_name = last_name
    @email = email
  end

end
Person#name, que regresa el nombre completo de una persona.
Person#information, que regresa toda la información de la persona.
Ejemplos:

person = Person.new('Daniel', 'Garcia', 'daniel@mail.com')
person.name
# => Daniel Garcia
person.information
# => Name: Daniel Garcia
# => Email: daniel@mail.com
=end
class Person
  attr_accessor :first_name, :last_name, :email

  def initialize(first_name, last_name, email)
    @first_name = first_name
    @last_name = last_name
    @email = email
  end

  def name
    puts "#{@first_name} #{@last_name}"
  end

  def information
    name
    puts @email
  end
end

person = Person.new('Daniel', 'Garcia', 'daniel@mail.com')
person.name
# => Daniel Garcia
person.information
# => Name: Daniel Garcia
# => Email: daniel@mail.com
