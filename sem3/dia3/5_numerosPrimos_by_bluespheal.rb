def prime_finder(n, divisor, result)
  while n > 1
    if n % divisor == 0
      n /= divisor
      result << divisor
    else
      divisor += 1
    end
  end
end

def prime_factors(n)
  divisor = 2
  result = []
  prime_finder(n, divisor, result)
  p result
end
prime_factors(1200)
prime_factors(6936)
