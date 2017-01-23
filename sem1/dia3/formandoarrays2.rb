def array_index(a,repeticiones)
  respuesta = []

  a.each do |a2| 
    i=1
    bloque =[]
    while i <= repeticiones
      bloque.push(i)
      i +=1
    end
    respuesta.push([a2,bloque])
  end
  respuesta  
end
#test
p array_index(["c", "b", "a"], 2) == [["c", [1, 2]], ["b", [1, 2]], ["a", [1, 2]]]
p array_index(["a"], 3) == [["a", [1, 2, 3]]]