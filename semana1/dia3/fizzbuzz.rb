def fizzbuzz(min,max)
  respuesta =[]
  (min..max).each do |i|
    
    if (i % 3 == 0 && i % 5 == 0)
      r = "FizzBuzz"
    elsif i % 5 == 0
      r = "Buzz"
    elsif i % 3 == 0
      r = "Fizz"    
    else
      r = i
    end
    respuesta.push(r)
  end
  respuesta
end

# Pruebas
p fizzbuzz(3, 5) == ["Fizz", 4, "Buzz"]
p fizzbuzz(10, 15) == ["Buzz", 11, "Fizz", 13, 14, "FizzBuzz"]