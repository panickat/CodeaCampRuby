=begin
Serie De Fibonacci
Crea el método fibonacci que recibe como parámetro un entero positivo (n) y regresa el n número en la serie de Fibonacci.
La serie de Fibonacci comienza con los números 1 y 1, y a partir de éstos, cada siguiente número se obtiene de la suma de los dos números anteriores.
1, 1, 2, 3, 5, 8, 13, 21, 34, 55, ...
=end
#f= f-1 + f-2
def fibonacci(n)
return if n < 2

fx = 0
h1 = 1
h2 = 2

  for i in 4..n
    fx = h1 + h2
     if h1 < h2
       h1 = h2
       h2 = fx
     end
    p "Loop #{i}   fx: #{fx} =  #{h1} +  #{h2}"
  end
end
=begin
0 1 1 2 3 5 8
0 1 2 3 4 5 6

L0    fx:0  = 0 + 0
L1    fx:1  = 0 + 1
L2    fx:1  = 0 + 1
L3    fx:2  = 1 + 1   fx > h1 = h2
L4    fx:3  = 1 + 2   fx > h2 & h2 > h1
L5    fx:5  = 2 + 3   fx > h2 & h2 > h1
L6    fx:8  = 3 + 5
=end

# Pruebas
fibonacci(12)
