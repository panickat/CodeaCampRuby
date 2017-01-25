=begin
Los Enumerables Cobran Vida

Antes que nada, sabes lo que es un enumerable? seguramente ya has utilizado alguno, por ejemplo el método each es uno de ellos.

Los Enumerables son posibles en Ruby gracias al concepto de mixins. En muchos de los lenguajes el poder compartir código solamente es posible a través de inheritance. Adicional a las clases, Ruby contiene modules. Estos son contenedores de métodos y constantes los cuales sirven para compartir métodos a través de clases que son diferentes y no tienen una relación de inheritance entre ellas.

Si quieres saber si una clase comparte el modulo Enumerable:

Array.included_modules
=> [Enumerable, Kernel]
Enlaces Externos
Ejemplos Visuales de los Enumerables
Objetivos Académicos
Conocer diferentes métodos Enumerables
Conocer algunas de las clases que comparten el modulo Enumerable
Poder explicar de manera realista como funcionan los Enumerables
Actividades
Para esta actividad se necesitará de todos tus compañeros.

El primer paso es escoger al menos 7 métodos enumerables. Deberán investigar como funcionan y que clases pueden utilizar dicho método. Deberán comprender tanto su funcionamiento, como su formato y en el caso de poder pasar un bloque de código, como funciona. Pueden dividirse en equipos pero al final los resultados se deben de presentar al grupo, para que todos comprendan todos los enumerables.

Una vez que comprendan su funcionamiento deberán crear un ejemplo real para el cual sirva cada método. Deberán expresar su ejemplo tanto en código como en realidad.

Ejemplo
Imaginemos que tenemos un bote lleno de Jelly Beans y somos algo espciales. No nos gusta comernos los rojos. Por ello necesitamos una manera de poder sacarlos de nuestro bote.

Method: Reject!
Class: Array (de jelly beens)
Format: reject! { | item | block } → new_ary
Block: { |jelly_bean| jelly_bean = "rojo" }

Result: array de jelly beens sin jelly beens rojos

bote_jelly_beans = []
colores = ["rojo", "azul", "amarillo" , "verde"]

20.times do
    bote_jelly_beans << colores.sample
end

p bote_jelly_beans

bote_jelly_beans.reject! { |jelly_bean| jelly_bean == "rojo" }

p bote_jelly_beans.include?("rojo") == false
Ejemplo real: Conseguir un bote jelly beans e ir escogiendo de uno en uno, revisar si el color es rojo, y en el caso de ser rojo quitarlo del bote.

Más Enumerables
Ahora nos toca a nosotros decidir que métodos deberás implementar. En el siguiente código hay una serie de ejercicios los cuales tendrás que resolver con el eumerable asignado.

# Dado un array de números imprime únicamente los elementos que contienen un indice impar
# Utiliza: Enumerable#each_with_index
def print_odd_indexed_integers(array)
end

# Dado un array de números regresa un array con solo sol numeros impares
# Utiliza: Enumerable#select
def odd_integers(array)
end

# Dado un array y un límite regresa el primer numero que sea menor al límite
# Utiliza: Enumerable#find
def first_under(array, limit)
end


# Dado un array de strings y regresa un nuevo array donde todos los elementos contengan al final un signo de admiración.
# Utiliza: Enumerable#map
def add_bang(array)
end

# Dado un array de números calcula la suma de todos sus elementos.
# Utiliza: Enumerable#reduce
# Repite el ejercicio con Enumerable#inject
def sum(array)
end


# Dado un array de string reorganizalo en grupos de tres y ordénalos alfabéticamente.
# Utiliza: Enumerable#each_slice
def sorted_triples(array)
end

# Driver code... no modifiques nada de este código
print_odd_indexed_integers([2, 4, 6, 8, 10, 12])
# => 4
# => 8
# => 12

puts odd_integers([3, 4, 7, 9, 10, 16]) == [3, 7, 9]

puts first_under([13, 21, 7, 0, 11, 106], 10) == 7

puts add_bang(["hi", "mom"]) == ["hi!", "mom!"]

puts sum([1, 1, 2, 3, 5]) == 12

words = %w(De esta simple manera se puede reorganizar una oración)
p sorted_triples(words) == [["De", "esta", "simple"], ["manera", "puede", "se"], ["oración", "reorganizar", "una"]]
=end
# Dado un array de números imprime únicamente los elementos que contienen un indice impar
# Utiliza: Enumerable#each_with_index
def print_odd_indexed_integers(array)
  r = []
  array.each_with_index {|item,index| r << item  unless index.even?}
end

# Dado un array de números regresa un array con solo sol numeros impares
# Utiliza: Enumerable#select
def odd_integers(array)
  array.select {|s| s unless s.even?}
end

# Dado un array y un límite regresa el primer numero que sea menor al límite
# Utiliza: Enumerable#find
def first_under(array, limit)
  array.find {|f| f if f < limit}
end


# Dado un array de strings y regresa un nuevo array donde todos los elementos contengan al final un signo de admiración.
# Utiliza: Enumerable#map
def add_bang(array)
  array.map {|m| m + "!"}
end

# Dado un array de números calcula la suma de todos sus elementos.
# Utiliza: Enumerable#reduce
# Repite el ejercicio con Enumerable#inject
def sum(array)
  #array.inject {|memo,item| memo += item}
  #array.inject(:+)
  array.reduce(:+)
end


# Dado un array de string reorganizalo en grupos de tres y ordénalos alfabéticamente.
# Utiliza: Enumerable#each_slice
def sorted_triples(array)
  r = []
  array.each_slice(3) {|e| r << e.sort }
  r
end

# Driver code... no modifiques nada de este código
print_odd_indexed_integers([2, 4, 6, 8, 10, 12])
# => 4
# => 8
# => 12

puts odd_integers([3, 4, 7, 9, 10, 16]) == [3, 7, 9]

puts first_under([13, 21, 7, 0, 11, 106], 10) == 7

puts add_bang(["hi", "mom"]) == ["hi!", "mom!"]

puts sum([1, 1, 2, 3, 5]) == 12

words = %w(De esta simple manera se puede reorganizar una oración)
p sorted_triples(words) == [["De", "esta", "simple"], ["manera", "puede", "se"], ["oración", "reorganizar", "una"]]
