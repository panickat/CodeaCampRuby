=begin
Números Primos

Como ultimo ejercicio de matemáticas vamos a ver los números primos. Un número primo es aquel número natural mayor a 1 que tiene únicamente dos divisores distintos, el uno y él mismo. Uno no es considerado numero primo. Los números primos menores a 100 son:

2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89 y 97...
Los número primos son importantes para la tecnología y utilizados en la encriptación de código para generar seguridad.RSA

Teorema fundamental de la aritmética
El Teorema fundamental de la aritmética afirma que todo entero positivo se puede representar de forma única como producto de factores primos.

Algunos ejemplos de estos son:

4 = 2*2
12 = 2*2*3
34 = 2*17
1200 = 2*2*2*2*3*5*5
6936 = 2*2*2*3*17*17
Divide y Vencerás
La principal tarea de un buen programador es la resolución de problemas.

Te has preguntado que pasos sigues para resolver un problema?
Tienes o sigues alguna metodología cada vez que te enfrentas a este proceso?
En Computer Science divide y vencerás hace referencia a uno de los más importantes paradigmas de diseño algorítmico y este esta basado en la resolución recursiva de un problema. Que quiere decir esto?

Esto quiere decir que cuando te enfrentas a problema, puedes dividir este problema en subproblemas consecutivamente hasta que encuentres un problema el cual tenga una respuesta simple o obvia.

Inténtalo!!!

Enlaces Externos
Cómo calcular los números primos
Objetivos Académicos
Empezar a distribuir responsabilidad en diferentes métodos
Reflexionar en el proceso de resolución de problemas
Actividades
Deberás crear un método que reciba un integer y devuelva un array con la combinación de números primos que lo componen. Aplica el paradigma Divide y Vencerás y escribe pseudocódigo antes de empezar con el código.

Recuerda refactorizar al final y preguntarte que tan eficiente esta siendo tu programa.

ejemplo:

prime_factors(4) => [2, 2]
prime_factors(9) => [3, 3]
prime_factors(12) => [2, 2, 3]
prime_factors(34) => [2, 17]
=end
# teorema de factorización única
#Metodo: Recive numero y regresa array de factorizacion
def factoring(n)
  require "prime"
  _prime = 0
  result = []
  n2 = n
    # While: Recorre lista de primos
  for i in 1..n
    _prime = Prime.first(i).last

    # Residuo: Si existe avanzar al siguiente primo
    #p "until result: " + result.to_s + " p: " + _prime.to_s + " reduce: " + result.reduce(:*).to_s + "  n2: " + n2.to_s
    while n2 % _prime == 0 && n2 != _prime
      n2 = n2 / _prime
      result << _prime
      #p "2do while result: " + result.to_s + " n2 :" + n2.to_s
    end
    if result.empty? == false  && result.reduce(:*) * _prime == n
      result << _prime
      return result
    end
  end
#Resultado: regresar
result
end
#test
p factoring(4).to_s == [2, 2].to_s
p factoring(9).to_s == [3, 3].to_s
p factoring(12).to_s == [2, 2, 3].to_s
p factoring(34).to_s == [2, 17].to_s
p factoring(1200).to_s == [2, 2, 2, 2, 3, 5, 5].to_s
p factoring(6936).to_s == [2, 2, 2, 3, 17, 17].to_s
