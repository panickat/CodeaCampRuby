=begin
Algoritmo Linear Search

En Harvard el primer día de clases, en la carrera de Computer Science dentro del curso de introducción, explican lo que es un algoritmo. Los primeros dos algoritmos que explican ese día son linear search y binary search.

Un algoritmo es una serie de operaciones independientes explicadas paso por paso para ser realizadas.

Tal cual, una receta de cocina. Este es un ejemplo de un algoritmo para hacer un sandwich.

get two slices of bread
get jar of peanut butter
if jar is empty then
get a new jar
if no new jar is available then
give up
place peanut butter on one slice of bread
place peanut butter on the other slice of bread
put the two bread slices together so that the peanut butter stays in the middle
enjoy!!!
Un error dentro de este algoritmo podría ser, el paso de poner peanut butter a uno de los panes. No explica como hacerlo y da por hecho que ya lo sabes hacer.

Lo hago con la mano?
Meto el pan dentro del bote?
Puede que sea buena idea explicar que es un cuchillo, donde encontrarlo y como usarlo para embarrar el peanut butter en un lado del pan. (Este puede ser un algoritmo diferente usado dentro del nuestro)
Ningún algoritmo es perfecto y pueden existir diferentes maneras de implementarlo aunque resuelva el mismo problema. Es importante conocer los precedentes. Por ejemplo, si le estuviera explicando a un marciano dentro de una cocina estos pasos, seguramente preguntará: dónde están los panes? y dónde esta bote de peanut butter? y seguramente qué es un pan, un bote y peanut butter?. Si no estas ahí para explicarle, tu algoritmo ya no sirvió y no podrá acabarlo.

Linear Search
Ruby muchas veces como magia nos ofrece métodos que nos hacen la vida más fácil, por ejemplo cuando encuentra el indice de un numero dentro de un array. Estos algoritmos, son muy básicos y por ello deben de ser muy eficientes en cuanto al tiempo de ejecución y a la memoria que utilizan.

Linear search or sequential search es un método que sirve para encontrar un valor particular dentro de un arreglo de datos, revisando cada elemento secuencialmente hasta encontrar el valor, o que se acabe la lista.

Objetivos Académicos
Comprender el concepto de algoritmo
Resolver uno de los algoritmos básicos de Computer Science
Actividades
Escribe un método llamado linear_search que tome como argumento un número y un arreglo. Este método debe regresar el índice del primer elemento que sea igual al valor del número, revisando dentro del arreglo cada valor secuencialmente. En caso de no encontrar el número debe regresar nil.

No podrás utilizar métodos de Array ni sus enumerables (each, map, etc ), si no que debes de utilizar iteradores como for while o until. El único método que puedes utilizar es: Array#[]

random_numbers = [ 4, 3, 2, 20, 5, 64, 78, 11, 43 ]
linear_search(20, random_numbers)
# => 3
linear_search(29, random_numbers)
# => nil
Después deberás crear un método que regrese un array con los indices donde encuentre el objeto y un array vació si no existe, llama este método global_linear_search.

arr = "entretenerse".split('')

p global_linear_search("e", arr)
# => [0, 4, 6, 8, 11]
=end
def linear_search(locate,array)
  #while array
  for index in 0..array.length - 1
    #encontrar numero buscado
    return index if array[index] == locate
  end
  #regresar valor
  nil
end

random_numbers = [ 4, 3, 2, 20, 5, 64, 78, 11, 43 ]
p linear_search(20, random_numbers)
# => 3
p linear_search(29, random_numbers)
# => nil

puts "******* Ejersicio 2 *******"
def global_linear_search(locate,a)
  r = []
  #while array
  for i in 0..a.length - 1
    #encontrar caracter buscado
    #crear array de respuesta
    r << i if a[i] == locate
  end
  #regresar array respuesta
  r.empty? ? nil : r
end

arr = "entretenerse".split('')
p global_linear_search("e", arr)
# => [0, 4, 6, 8, 11]
