def binary_search(num, array)
  index = 0
  sorted = array.sort
  first_half = sorted.each_slice( (array.length / 2.0).round).to_a[0]
  second_half = sorted.each_slice( (array.length / 2.0).round).to_a[1]
  half = (sorted.length / 2)

  if num == sorted[half]
    half
  elsif num < sorted[half]
    binary_search(num, first_half)
  else
    binary_search(num, second_half)
  end
end
p binary_search(1, [1]) == 0
#p binary_search(4, [1,2,3]) == nil
p binary_search(4, [1,2,3,4,5]) == 3
p binary_search(6, [1,2,3,4,5,6,7,8,9]) == 5
p binary_search(2, [1,2,3,5,6,7,8,9,10,11]) == 1
p binary_search(5, [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]) == 4
