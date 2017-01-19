=begin
Analizando El Error

Dado el siguiente código...

asignature = Asignature.new
p asignature.math
Y el siguiente mensaje de error...

#=> private method `math' called for #<Asignature:0x8d483cc> (NoMethodError)
¿Qué harías para solucionarlo? Haz pasar la siguiente prueba:

p asignature.math == "Mathematics"
#=>true
=end
class Asignature
  def math; "Mathematics" end
end

asignature = Asignature.new
p asignature.math

#test
p asignature.math == "Mathematics"
#=>true
