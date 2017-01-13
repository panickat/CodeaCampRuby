def get_index(a)
  i, newArray =0,Array.new
  a.each {|e| 
    newArray.push([e,i])  
    i +=1
  }
  return newArray
end

#test
p get_index([2, 10, 6, 34, 0, 3]) == [[2, 0], [10, 1], [6, 2], [34, 3], [0, 4], [3, 5]]