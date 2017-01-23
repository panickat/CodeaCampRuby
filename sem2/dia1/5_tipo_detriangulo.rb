def triangle_type(a,b,c)
  case  
  when a != b && a != c && b != c
      "Escaleno"
  when a == b && a == c && b == c
     "Equilatero"
  else
     "Isósceles"
  end   
end

#test
p triangle_type(7, 7, 7) == "Equilatero"
p triangle_type(8, 8, 4) == "Isósceles"
p triangle_type(6, 4, 3) == "Escaleno"
p triangle_type(15, 7, 4) == "Escaleno"