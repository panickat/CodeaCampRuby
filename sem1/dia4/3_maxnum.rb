def min(a)
  ref=a[0]
  a.each do |n|
    ref=n if n < ref   
  end
  ref
end
# Pruebas
p min([-20, -10, 0, 10, 20]) == -20
p min([1, 2, 3, 4, 5]) == 1
p min([5, 4, 3, 2, 1]) == 1
