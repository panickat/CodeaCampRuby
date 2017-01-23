def mode(a)
  moda=[]
  sin_repeticiones=0

  a.group_by{ |e| e }.select { |k, v| 
    
    if v.size > 1 
      moda.push(v.uniq[0])
    else 
      sin_repeticiones +=1
    end

    if sin_repeticiones == a.count
      moda = a
      sin_repeticiones=0
    end
  }
  moda
end

# Pruebas
p mode([1, 2, 2, 3]) == [2]
p mode([1, 2, 2, 3, 3, 4]) == [2, 3]
p mode([1, 2, 3]) == [1, 2, 3]
p mode([0, 1, 2, 3, 4, 0]) == [0]
