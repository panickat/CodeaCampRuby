=begin
Encadenando Los Métodos

Como lo hemos dicho tantas veces al escribir código es muy importante refactorizarlo para que este organizado y sea fácil de leer. Encadenar métodos es un técnica que busca crear código más claro y conciso.

En un principio será coherente escribir código seguido y en varias lineas, donde verticalmente se comprenda el flujo del programa pero a la larga no es lo más eficiente.

Al refactorizar hay que tratar de usar las menos líneas posibles, pero hay que ser inteligentes y saber en que momento, menos líneas, ponen en riesgo la facilidad de lectura y es ahí donde hay que parar.

En Ruby el código que se lee más fácil y está elegante organizado es más profesional que el compacto y complejo.

Si entiendes como funcionan las Clases y sus Métodos puedes leer este artículo para comprender como se escribe código en el que los métodos podrán ser encadenados:

A Guide to Method Chaining.
Objetivos Académicos
Aprender a escribir código elegante
Escribir métodos claros, que se expliquen por sí solos.
Comprender el encadenamiento de métodos.
Actividades
El primero de los métodos necesita ser refactorizado encadenando los metodos a una línea.

El segundo de los métodos es un ejemplo de un método de una linea pero muy complicado de leer y entender que hace, trata de mejorarlo aunque uses más lineas.

Para este ejercicio el siguiente código contiene una explicación de como resolver cada parte del código.

# TODO: Refactoriza buscando elegancia
def shout_backwards(string)
  all_caps  = string.upcase
  backwards = all_caps.reverse
  result    = backwards + "!!!"

  return result
end


# AYUDAME: Refactoriza buscando elegancia
def squared_primes(array)
  array.find_all{|x| (2..x-1).select(){|i| x % i == 0 }.count == 0 }.map{|p| p*p}
end

# Driver code... no edites este texto. En la consola esto deberá imprimir puros trues
puts shout_backwards("hello, boot") == "TOOB ,OLLEH!!!"
puts squared_primes([1, 3, 4, 7, 42]) == [1, 9, 49]
=end
# TODO: Refactoriza buscando elegancia
def shout_backwards(string)
  "#{string.upcase.reverse}!!!"
end

# AYUDAME: Refactoriza buscando elegancia
def squared_primes(array)
  array.find_all{
    |x| (2..x-1).select {
      |i| x % i == 0
    }.count == 0
  }.map{
    |p| p*p
  }
end

# Driver code... no edites este texto. En la consola esto deberá imprimir puros trues
puts shout_backwards("hello, boot") == "TOOB ,OLLEH!!!"
puts squared_primes([1, 3, 4, 7, 42]) == [1, 9, 49]
