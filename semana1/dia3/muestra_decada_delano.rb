def decade(y)
  y = y.to_s.split(//).last(2).join
  
  case y.to_i
    when 20..29
      d="Twenties"
    when 30..39
      d="TREINTAS"
    when 40..49
      d="Forties"
    when 50..59
      d="Fifties"
    when 60..69
      d="Sixties"
    when 70..79
      d="Seventies"
    when 80..89
      d="Eighties"
    when 90..99
      d="Nineties"
  end
end

# Pruebas
p decade(1920) == "Twenties"
p decade(1943) == "Forties"
p decade(1952) == "Fifties"
p decade(1960) == "Sixties"
p decade(1975) == "Seventies"
p decade(1982) == "Eighties"
p decade(1999) == "Nineties"