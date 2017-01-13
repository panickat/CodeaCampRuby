def print_hash(h)
  "La llave del Hash es '#{h.keys[0]}' y su valor es #{h.values[0]}"
end

#test
p print_hash({"frecuencia" => 4}) == "La llave del Hash es 'frecuencia' y su valor es 4"