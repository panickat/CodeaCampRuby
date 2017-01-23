title, description, number_of_likes = "mi titulo", "mi descripcion", 10
street, number, state, city, zip = "mi calle", 1,"mi estado", "mi ciudad",'09890'


datos = Array.new([title, description, number_of_likes,street, number, state, city, zip])
datos.each {|var| puts "valor = '" + var.to_s + "' tipo de dato = " + var.class.name}
#p datos -> es la abreviacion de -> puts datos.inspect

=begin
Este es el out put
valor = 'mi titulo' tipo de dato = String
valor = 'mi descripcion' tipo de dato = String
valor = '10' tipo de dato = Fixnum
valor = 'mi calle' tipo de dato = String
valor = '1' tipo de dato = Fixnum
valor = 'mi estado' tipo de dato = String
valor = 'mi ciudad' tipo de dato = String
valor = '9890' tipo de dato = Fixnum
=end