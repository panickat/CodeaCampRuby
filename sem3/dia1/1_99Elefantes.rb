=begin 99 Elefantes

Seguramente te sonará esta canción:

1 elefante se columpiaba sobre la tela de una araña, como veía que resistía fueron a llamar a otro elefante.
2 elefante se columpiaba sobre la tela de una araña, como veía que resistía fueron a llamar a otro elefante.
3 elefante se columpiaba sobre la tela de una araña, como veía que resistía fueron a llamar a otro elefante.
4 elefante se columpiaba sobre la tela de una araña, como veía que resistía fueron a llamar a otro elefante.

Objetivos Académicos
Conocer los métodos puts y print
Comprender diferentes tipos de loops para itegers
Uso de Rangos
Comprensión de Variables
Actividades
Tienes que escribir un programa que modele la canción de los elefantes del 1 al 99. Utiliza rangos y loops. Haz que tu programa pueda recibir el número de elefantes en el que se rome la telaraña. Juega con la diferencia de utilizar puts y print. En USA cantan una canción similar que se llama “99 bottles of beer”, la diferencia es que el conteo va en reversa. Busca una manera de hacer un loop fácilmente y para ello existe un método.
=end
def elefantes
  (1..99).each {|n|
    plural_s = "s"; plural_n ="n"  if n > 1
    puts "#{n} elefante#{plural_s} se columpiaba#{plural_n} sobre la tela de una araña, como veía#{plural_n} que resistía fueron a llamar a otro elefante."
  }
end
elefantes
