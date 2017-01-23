=begin
Módulo Enumerable
El módulo Enumerable de Ruby tiene muchas funciones útiles para trabajar con Array.
Lee la documentación de este módulo, algunas de los métodos más utilizados son:
count
detect/find
each_slice
each_with_index
find_all/select
find
group_by
inject/reduce
map
sort
zip
Crea los siguientes métodos sin usar each.

Strings en índices nones de un arreglo
Regresa un arreglo con los Strings en las posiciones 1, 3, 5, 7, etc.
=end
def odd_indexed(a)
  result = Array.new
  a.each_with_index {|item,index| result << item unless (index +1).even? }
  result
end
p "Strings en índices nones de un arreglo"
p odd_indexed(["uno", "dos", "tres", "cuatro", "cinco"]) == ["uno", "tres", "cinco"]

# Regresa todos los Strings que tienen una longitud mayor a 4 caracteres.
def long_strings(a); a.select {|s| s.length > 4} end
p "Strings de tamaño mayor a 5"
p long_strings(["rojo", "morado", "azul", "negro", "blanco", "naranja"]) == ["morado", "negro", "blanco", "naranja"]

# Regresa el primer String que empieza con la letra 'h'.
def start_with_h(a)
   a.select {|s| return s if s.chr == "h"}
end
p "Primer string que empieza con 'h'"
p start_with_h(["manzana", "naranja", "sandia", "higo", "melon", "platano", "huevo"]) == "higo"

#Regresa el mismo Array de String que recibe pero ahora todos los Strings tienen la primera letra mayúscula.
def capitalize_array(a); a.collect(&:capitalize) end
p "Que todos los strings empiecen con mayúscula"
p capitalize_array(["manuel", "juan", "rodrigo", "ana", "paola"]) == ["Manuel", "Juan", "Rodrigo", "Ana", "Paola"]

#Regresa un Hash donde las keys son las primeras letras de los Strings y los values son todos los Strings que empiezan con esa letra.
def group_by_starting_letter(a); a.group_by(&:chr) end
p "Agrupar strings por su primera letra"
p group_by_starting_letter(["arbol", "amarillo", "angel", "burro", "barco"]) == {"a"=>["arbol", "amarillo", "angel"], "b"=>["burro", "barco"]}

#Regresa el número de letras 'r' que tiene un string.
def number_of_r(s); s.count("r") end
p "Contar el número de 'r' en un string"
p number_of_r("ferrocarril") == 4
