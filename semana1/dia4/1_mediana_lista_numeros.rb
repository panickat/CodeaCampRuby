def median(a)
  a.sort!
  center = a.count/2
  a.count.even? ? (a[center-1] + a[center]).to_f/2 : a[center] 
end

# Pruebas
p median([4, 5, 6]) == 5
p median([-3, 0, 3]) == 0
p median([2, 3, 4, 5]) == 3.5
p median([1, 8, 10]) == 8