def array_index(a,repeticiones)
  respuesta = []

  a.each do |a2| 
    i=1
    while i <= repeticiones
      respuesta.push([a2,i])
      i +=1
    end
  end
  respuesta  
end
#test
p array_index(["c", "b", "a"], 2) == [["c", 1], ["c", 2], ["b", 1], ["b", 2], ["a", 1], ["a", 2]]
p array_index(["a"], 3) == [["a", 1], ["a", 2], ["a", 3]]