=begin
Lee El Error

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

Para este ejercicio copia el siguiente código el cual que contiene una explicación de como resolver cada parte.

# Refactoriza para que solamente te quede un renglón elegante
def dummy_encrypt(string)
    word_reverse = string.reverse
    swapped_word = word_reverse.swapcase
    encrypted_word = swapped_word.gsub(/[aeio]/,"*")

    return encrypted_word
end


# Descompón el método en tres métodos nuevos para hacer más comprensible el código
# Lee el método y comprende que hace y que resultado regresa

def max_letter_frequency_per_word(sentence)
    sentence.split.select{|word| word.length > 3}.map{ |w| w.count("e") }.max
end

def words_longer_than(array,num)
end

def letter_per_word(array,letter)
end

def numbers_larger_than(num_array)
end

# Estas son pruebas que no debes de modificar
# Antes y después de modificar los métodos anteriores estas lineas deben de imprimir "true"
puts dummy_encrypt("EsteEsMiPassword") == "DROWSSApImS*ETS*"

puts max_letter_frequency_per_word("entero entrar envase enviar enzima equino equipo erario erguir eriaza eriazo erigir eringe eficientemente electroencefalografía") == 5
=end
# Refactoriza para que solamente te quede un renglón elegante
def dummy_encrypt(string)
    return string.reverse.swapcase.gsub(/[aeio]/,"*")
end

# Descompón el método en tres métodos nuevos para hacer más comprensible el código
# Lee el método y comprende que hace y que resultado regresa

def max_letter_frequency_per_word(sentence)
  return sentence.split.select{|word| word.length > 3}.map{ |w| w.count("e") }.max
end

def max_letter_frequency_per_word2(sentence)
  numbers_larger_than(letter_per_word(words_longer_than(sentence.split,3),"e"))
end

def words_longer_than(array,num)
  return array.select { |word| word.length > num  }
end

def letter_per_word(array,letter)
  return array.map {|w| w.count(letter)}
end

def numbers_larger_than(num_array)
  num_array.max
end

# Estas son pruebas que no debes de modificar
# Antes y después de modificar los métodos anteriores estas lineas deben de imprimir "true"
puts dummy_encrypt("EsteEsMiPassword") == "DROWSSApImS*ETS*"
puts max_letter_frequency_per_word("entero entrar envase enviar enzima equino equipo erario erguir eriaza eriazo erigir eringe eficientemente electroencefalografía") == 5
