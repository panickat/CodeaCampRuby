=begin
Algoritmo Binary Search

Después de haber creado linear_search podemos darnos cuenta que revisar numero por numero no es muy eficiente y debe haber una mejor manera de hacerlo.

Cuando eras chico seguramente jugaste este juego:

Piensa en un número del 1 al 100.
El número es menor a 50?
- Si
El numero es menor a 25?
- No
Y así hasta agotar las posibilidades.
Compara cuantas operaciones realizas si buscas secuencialmente o de esta manera.

Esto es Binary Search, así de simple. -> https://en.wikipedia.org/wiki/Binary_search_algorithm

Aunque según Jon Bentley puso este problema a programadores profesionales y el 90% no pudo crear una implementación correcta después de unas horas de trabajo. Además la misma implementación de Bentley publicada en su libro Programming Pearls en 1986 tenía un error que no fue encontrado durante veinte años.

Objetivos Académicos
Uso de condicionales e ciclos
Comprender como mejorar la eficiencia de un algoritmo
Actividades
Para este ejercicio es importante crees un Driver Code con muchas pruebas para verificar que tu algoritmo es correcto y que siempre regresa lo mismo.

Para este método es importante que el arreglo este ordenado ascendentemente, tampoco puedes utilizar Array#index y te recomendamos mucho que antes de escribir código escribas pseudocódigo.

https://www.youtube.com/watch?v=JQhciTuD3E8

Aquí dejamos algunas pruebas para que compruebes que funciona tu implementación.

p binary_search(1, [1]) == 0
p binary_search(4, [1,2,3]) == nil
p binary_search(4, [1,2,3,4,5]) == 3
p binary_search(6, [1,2,3,4,5,6,7,8,9]) == 5
p binary_search(2, [1,2,3,5,6,7,8,9,10,11]) == 1
p binary_search(5, [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]) == 4
=end
=begin
Procedure[edit]
Given an array A of n elements with values or records A0 ... An−1, sorted such that A0 ≤ ... ≤ An−1, and target value T, the following subroutine uses binary search to find the index of T in A.[6]

Set L to 0 and R to n − 1.
If L > R, the search terminates as unsuccessful.
Set m (the position of the middle element) to the floor (the largest previous integer) of (L + R) / 2.
If Am < T, set L to m + 1 and go to step 2.
If Am > T, set R to m – 1 and go to step 2.
Now Am = T, the search is done; return m.
=end
def binary_search(target,array)
  array.sort!
  l = 0
  r = array.length - 1
  result = target + 1
  until result == target
    m = middle(l,r)
    #p "l:#{l.to_s}  r:#{r.to_s}  m:#{m.to_s}"
    result = array[m]

    l = m + 1 if result < target
    r = m - 1 if result > target
    return nil if l > r
  end
  m
end
def middle(l,r)
  return 0 if r == 1
  ((l + r) /2).floor
end

p binary_search(0, [2,1,-2,-1,-5,0]) == 3
p binary_search(1, [1]) == 0
p binary_search(4, [1,2,3]) == nil
p binary_search(4, [1,2,3,4,5]) == 3
p binary_search(6, [1,2,3,4,5,6,7,8,9]) == 5
p binary_search(2, [1,2,3,5,6,7,8,9,10,11]) == 1
p binary_search(5, [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]) == 4
