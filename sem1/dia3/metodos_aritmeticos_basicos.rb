def add(a,b)
  r = a+b
end

def substract(a,b) 
  r = a-b
end

def multiply(a,b)
  r = a*b
end  

def divide(a,b)
  r = a.to_f/b.to_f
end

# Pruebas
p add(10, 2) == 12
p substract(10, 2) == 8
p multiply(10, 2) == 20
p divide(10, 4) == 2.5