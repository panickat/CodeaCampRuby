def table
  tabla = []
  tabla << ["Nombre","Edad","Genero","Grupo","Calificaciones"]
  tabla << ["Rodrigo García",     13,   "Masculino", "Primero",  [9, 9, 7, 6, 8]]
  tabla << ["Fernanda Gonzalez",  12,   "Femenino",  "Tercero",   [6, 9, 8, 6, 8]]
  tabla << ["Luis Perez",         13,   "Masculino", "Primero",   [8, 7, 7, 9, 8]]
  tabla << ["Ana Espinosa",       14,   "Femenino",  "Segundo",   [9, 9, 6, 8, 8]]
  tabla << ["Pablo Moran",        11,   "Masculino", "Segundo",   [7, 8, 9, 9, 8]]

=begin Deveria funcionar pero repite el ultimo valor Pablo Moran
  array_de_hashs = []
  hash = Hash[tabla[0].map {|k| [k,0]}]

  tabla.drop(1).map {|line|
    hash["Nombre"] = line[0]
    hash["Edad"] = line[1]
    hash["Genero"] = line[2]
    hash["Grupo"] = line[3]
    hash["Calificaciones"] = line[4]
    array_de_hashs << hash
  }
=end
  a = []
  tabla.drop(1).map do |line|
    a << [
    ["Nombre",line[0]],
    ["Edad",line[1]],
    ["Genero",line[2]],
    ["Grupo",line[3]],
    ["Calificaciones",line[4]]
    ]
  end
  array_de_hashs = []
  a.each {|line| array_de_hashs << Hash[line] }
  array_de_hashs
end

table.each {|line| p line}
