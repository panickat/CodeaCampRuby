=begin
Crea un Lambda que muestre los strings que tienen más de 4 letras. Haz pasar las pruebas.

strings = ["ruby", "java", "c++", "javascript"]

p strings.select(&char_length).join(", ") == "javascript"
=end

strings = ["ruby", "java", "c++", "javascript"]

char_length = lambda { |n| n if n.length > 4 }

p strings.select(&char_length).join(", ") == "javascript"