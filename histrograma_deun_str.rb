puts "Texto, por favor: "
texto = gets.chomp

palabras = texto.split(" ")
frecuencias = Hash.new(0)
palabras.each { |palabra| frecuencias[palabra] += 1 }
frecuencias = frecuencias.sort_by {|a, b| b }
frecuencias.reverse!
frecuencias.each { |palabra, frecuencia| puts palabra + " " + frecuencia.to_s }