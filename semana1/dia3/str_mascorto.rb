def shortest(arr)
  a2= Array.new
  arr.each { |a|  a2.push(a.length) }  
  arr.select {|a| a.length == a2.min } 
end

# Pruebas
p shortest(['uno', 'dos', 'tres', 'cuatro', 'cinco']) == ["uno", "dos"]
p shortest(['gato', 'perro', 'elefante', 'jirafa']) == ["gato"]
p shortest(['verde', 'rojo', 'negro', 'morado']) == ["rojo"]
