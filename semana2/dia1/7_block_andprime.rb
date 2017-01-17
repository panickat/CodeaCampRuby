#Define el método prime que acepte un parámetro y use yield para llamar a un bloque. El bloque debe regresar los primeros diez números primos en un arreglo.

#test
#=>[2, 3, 5, 7, 11, 13, 17, 19, 23, 29]

def prime(a)
   yield a
end
p prime(prime.first(10)) {|i| i} == [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]