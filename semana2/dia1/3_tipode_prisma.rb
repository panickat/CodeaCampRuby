def prism_type(a,b,c)
  case  
  when a != b && a != c && b != c
      "cuboide"
  when a == b && a == c && b == c
     "cubo"
  when (a == b or a == c or b == c) && (a == b or a == c or b == c) 
     "prisma rectangular"
  end 
    
end

# Pruebas
p prism_type(5, 5, 5) == "cubo"
p prism_type(5, 5, 4) == "prisma rectangular"
p prism_type(5, 4, 3) == "cuboide"
p prism_type(10, 8, 2) == "cuboide"