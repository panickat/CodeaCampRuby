def each_loop(list)
  list.map  { |item|
    item + 1
  }
end

p each_loop([1, 4, 2, 10, 9]) == [2, 5, 3, 11, 10]