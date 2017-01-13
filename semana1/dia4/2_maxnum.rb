def max(a)
  ref=a[0]
  a.each do |n|
    ref=n if n > ref   
  end
  ref
end
# Pruebas
p max([-20, -10, 0, 10, 20]) == 20
p max([1, 2, 3, 4, 5]) == 5
p max([5, 4, 3, 2, 1]) == 5 