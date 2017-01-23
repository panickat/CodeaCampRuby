def range(x)
  range_str=""
  case x
    when 0..50
      range_str= "between 0 and 50"
    when 51..100
      range_str= "between 51 and 100"
    when -> (n) {n > 100}
       range_str= "above 100"
  end
  
 "#{x} is #{range_str}"
end

p range(10) == "10 is between 0 and 50"
p range(34) == "34 is between 0 and 50"
p range(79) == "79 is between 51 and 100"
p range(67) == "67 is between 51 and 100"
p range(54) == "54 is between 51 and 100"
p range(120) == "120 is above 100"