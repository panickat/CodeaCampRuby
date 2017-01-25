=begin
Métodos Destructivos

Espero que para este ejercicio ya conozcas bien lo que es un método y como estos pueden ayudarte a organizar tu código.

Los métodos reciben argumentos y por ello una forma de clarificarlos es dependiendo si modifican los argumentos que están recibiendo o si simplemente no los modifican.

Un método destructivo es aquel que al pasarle un argumento, el bloque de código que corre, modificará el valor de dicho argumento. Estos métodos por convención se escriben con un bang al final ej. reverse!. La mayoría de los métodos no son destructivos pero si llegas a ver uno que contenga el bang, ten cuidado porque seguramente esta haciendo algo importante por dentro.

Corre este ejemplo en tu consola para entender como funcionan los métodos destructivos y fíjate como cambia o se mantiene el valor de la variable name:

name = "Fernando"

puts "Valor de name: #{name}"

puts "Llamando al método reverse en name : #{name.reverse}"

puts "Valor de name despues de pasarlo por reverse: #{name}"

puts "Llamando al método reverse! en name : #{name.reverse!}"

puts "Valor de name después de pasarlo por reverse!: #{name}"
Objetivos Académicos
Comprender la importancia de los métodos destructivos
Modificación del valor de un argumento
Actividades
Deberás crear dos métodos que hagan lo mismo pero uno sea destructible y el otro no. También busca la manera de comprobar como el argumento que estas pasando a tus métodos conserva o pierde su valor. Piensa en un ejemplo real para el cual pueden servir tus dos métodos y basado en ello elabora el Driver Code para verificar su funcionamiento.

Nota: ya no puedes utilizar reverse.
=end
name = "Fernando"

puts "Valor de name: #{name}"

puts "Llamando al método upcase en name : #{name.upcase}"

puts "Valor de name despues de pasarlo por upcase: #{name}"

puts "Llamando al método upcase! en name : #{name.upcase!}"

puts "Valor de name después de pasarlo por upcase!: #{name}"
