=begin
Números Romanos

El sistema de numeración romana es un sistema de numeración no posicional que se desarrolló en la Antigua Roma y se utilizó en todo el Imperio romano.

Este ejercicio regresa a las bases de lo que es un código. Nuestro sistema de numeración representa con símbolos números, las computadoras lo hacen lo hacen con ceros y unos y los romanos lo hacían con letras.

Escrito - Cinco
Sistema Arábigo - 5
Sistema Binario (computadoras) - 00000101
Sistema Romano - V

Palitos - |||||

La siguiente tabla muestra los símbolos válidos en el sistema de los números romanos, y sus equivalencias en el sistema decimal:

I 1
V 5
X 10
L 50
C 100
D 500
M 1000
Objetivos Académicos
Uso del Ruby Case Statement.
Aprender a comprender el problema, la solución y su lógica.
Factorización de un Case Statement complejo.
Actividades
Al principio los romanos no se complicaban restando como se hace en el IV o IX si no que lo hacian más fácil el 9 era VIIII.

Eventualmente, a alguien terriblemente inteligente se le ocurrió poner un numero menor antes del mayor, lo que quiere decir que hay que restar uno al numero mayor. Por ello se te complicará más este ejercicio.

En este ejercicio crearas un programa que convierta integers a números romanos modernos.

Puedes empezar por crear un método para el sistema viejo para ir calentando pero la meta es crear el programa para el sistema nuevo que será más difícil.

Primero intenta escribir el programa utilizando el Case Statement, luego intenta refactorizarlo a utilizar un método más complejo, para ello investiga cual es la lógica para pasar de números arábigos a romanos.

Te recomendamos usar pseudocódigo y comprender la lógica antes de empezar a escribir. No intentes ser inteligente si no que aprende a apoyarte de estrategias que te ayuden a partir tu problema en problemas más fáciles de resolver DYV.

Algoritmo divide y vencerás
En la cultura popular, divide y vencerás hace referencia a un refrán que implica resolver un problema difícil, dividiéndolo en partes más simples tantas veces como sea necesario, hasta que la resolución de las partes se torna obvia. La solución del problema principal se construye con las soluciones encontradas.

Utiliza este estético driver code para verificar el funcionamiento correcto del programa. Si quieres puedes extenderlo.

Drive code... this should print out trues.

a = to_roman(1) == "I"
b = to_roman(3) == "III"
c = to_roman(4) == "IV"
d = to_roman(9) == "IX"
e = to_roman(13) == "XIII"
f = to_roman(14) == "XIV"
g = to_roman(944) == "CMXLIV"
h = to_roman(1453) == "MCDLIII"
i = to_roman(1646) == "MDCXLVI"


puts "|valid |input | expected | actual"
puts "|------|------|----------|-------"
puts "| #{a} |1     | I        | #{to_roman(1)}"
puts "| #{b} |3     | III      | #{to_roman(3)}"
puts "| #{c} |4     | IV       | #{to_roman(4)}"
puts "| #{d} |9     | IX       | #{to_roman(9)}"
puts "| #{e} |13    | XIII     | #{to_roman(13)}"
puts "| #{f} |14    | XIV      | #{to_roman(14)}"
puts "| #{g} |944   | CMXLIV   | #{to_roman(944)}"
puts "| #{h} |1453  | MCDLIII  | #{to_roman(1453)}"
puts "| #{i} |1646  | MDCXLVI  | #{to_roman(1646)}"
=end
# maximos caracteres acumulables 3
# c1 < c2 = c2 - c1 -> c1 = decenas  && c2 == decenas
# c1 > c2 = c1 + c2 -> c1 = decenas  && c2 == decenas
# c1 < c2 && c2 != decenas -> +
def to_roman(c)
  r = ""
  type = c.to_s.length

  c.to_s.split("").map(&:to_i).each do |e|
    r += memo(e, type)
    type -= 1
  end
  r
end
def memo(n,type)
  case type
  when 1
    convert(n,"I","V","X")
  when 2
    convert(n,"X","L","C")
  when 3
    convert(n,"C","D","M")
  when 4
    convert(n,"M","v","x")
  when 5
    convert(n,"c","d","m")
  end

end
def convert(n,a,b,c)
  r = ""
  case n
  when 1..3
    r = a if n == 1
    r = a + a if n == 2
    r = a + a + a if n == 3
  when 4
    r = a + b
  when 5
    r = b
  when 6..8
    r = b + a if n == 6
    r = b + a + a if n == 7
    r = b + a + a + a if n == 8
  when 9
    r = a + c
  end
  r
end
#test
a = to_roman(1) == "I"
b = to_roman(3) == "III"
c = to_roman(4) == "IV"
d = to_roman(9) == "IX"
e = to_roman(13) == "XIII"
f = to_roman(14) == "XIV"
g = to_roman(944) == "CMXLIV"
h = to_roman(1453) == "MCDLIII"
i = to_roman(1646) == "MDCXLVI"


puts "|valid |input | expected | actual"
puts "|------|------|----------|-------"
puts "| #{a} |1     | I        | #{to_roman(1)}"
puts "| #{b} |3     | III      | #{to_roman(3)}"
puts "| #{c} |4     | IV       | #{to_roman(4)}"
puts "| #{d} |9     | IX       | #{to_roman(9)}"
puts "| #{e} |13    | XIII     | #{to_roman(13)}"
puts "| #{f} |14    | XIV      | #{to_roman(14)}"
puts "| #{g} |944   | CMXLIV   | #{to_roman(944)}"
puts "| #{h} |1453  | MCDLIII  | #{to_roman(1453)}"
puts "| #{i} |1646  | MDCXLVI  | #{to_roman(1646)}"
