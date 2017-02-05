=begin
Público Vs Privado

El concepto de público y privado es muy importante dentro de un programa diseñado bajo el paradigma de OOP.

Un objeto se compone de información y de métodos. Depende de como diseñes el objeto, si estos son públicos o privados.

Es importante que un objeto solamente exponga lo indispensable y no toda la información que contiene. Simplemente debe compartir aquella información que otros objetos requieren para poder interactuar con ella.

Este ejercicio te ayudará a comprender como es que un objeto hace pública o privada ya sea información o métodos.

Objetivos Académicos
Comprender la diferencia entre métodos privados y públicos
Saber distinguir que hacer público de un objeto
Actividades
Deberás crear una clase Employee con las siguientes variables de instancia:

name
email
salary
deposit_account
¿Cuales de estas variables deben de tener un reader o writer? Piensa cual de estas variables deberán poder ser leídas o sobrescritas desde fuera de tu programa.

Vamos a esconder algo de información.
Deberás re-definir el método to_s para que regrese algo como esto:

puts employee
=> Juan Perez <email: juan@gmail.com> acct: 123456512
En el ejemplo anterior no es muy adecuando estar mostrando la cuenta de depósito del empleado. Crea un método privado que solamente muestre los últimos cuatro dígitos de este número.

puts employee
=> Juan Perez <email: juan@gmail.com> acct: *****6512
El método to_s es el símil del método toString de otros lenguajes de programación. Este método se utiliza para que nos devuelva una cadena de texto, que suele ser la información más relevante del objeto. Si haces una clase Dog vacía y llamas puts en una de sus instancias regresará #<Dog:0x007ffd389b7930>. Tu puedes re-definir este método y en nuestro caso, deberá regresar una representación gráfica de nuestro empleado. Cuando digo re-definir me refiero a que por default todas las clases ya lo tienen, ya que heredan de la clase object (si aún no has visto que quiere decir que una clase hereda de otra, ya lo aprenderás no te preocupes).

Que métodos deben ser públicos?
De los siguientes tres métodos decide cual de ellos solamente tiene sentido que se conozca internamente y cuales deben de ser públicos.

  def coefficient
    coefficients = { 1 => 0...1_000, 1.2 => 1_000...2_000, 1.4 => 2_000...5_000, 1.5 => 5_000..10_000 }

    coefficients.find { |coefficient, range| range.include? @salary }.first
  end

  def vacation_days
    coefficient * 7
  end

  def bonus
    coefficient * 1000
  end
Haz pasar el driver code
employee = Employee.new('Juan Perez', 'juan@gmail.com', 1_800, '123-456-512')

employee.to_s
# => "Juan Perez <email: juan@gmail.com> acct: *****6512"

str = "The employee information is #{employee}"
puts str
# => "The employee information is Juan Perez <email: juan@gmail.com> acct: *****6512"

puts str == "The employee information is Juan Perez <email: juan@gmail.com> acct: *****6512"

puts employee.vacation_days == 8.4
puts employee.bonus == 1_200
=end

class Employee
  def vacation_days
    coefficient * 7
  end

  def bonus
    coefficient * 1000
  end

  def initialize (name, email, salary, deposit_account)
    @name = name
    @email = email
    @salary = salary
    @deposit_account = deposit_account.gsub!("-","")
  end
  def to_s
    uncensored = @deposit_account =~ /[^\d]*\d{4}$/
    length = @deposit_account.length - 1

    acc = $`.gsub!(/\d/,"*") + @deposit_account[uncensored..length]
    "#{@name} <email: #{@email}> acct: #{acc}"
  end

  private
  def coefficient
    coefficients = { 1 => 0...1_000, 1.2 => 1_000...2_000, 1.4 => 2_000...5_000, 1.5 => 5_000..10_000 }

    coefficients.find { |coefficient, range| range.include? @salary }.first
  end
end

# driver code
employee = Employee.new('Juan Perez', 'juan@gmail.com', 1_800, '123-456-512')

employee.to_s
# => "Juan Perez <email: juan@gmail.com> acct: *****6512"

str = "The employee information is #{employee}"
puts str
# => "The employee information is Juan Perez <email: juan@gmail.com> acct: *****6512"

puts str == "The employee information is Juan Perez <email: juan@gmail.com> acct: *****6512"

puts employee.vacation_days == 8.4
puts employee.bonus == 1_200
