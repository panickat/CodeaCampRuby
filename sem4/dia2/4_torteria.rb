=begin
Torteria

Un amigo acaba de abrir un negocio de Tortas y se le están quemando.
Ayúdale a crear un programa para administrar el tiempo de horneado de los diferentes tipos de tortas.

El cocinero (user stories):

Necesita preparar diferentes tipos de tortas.
Necesita meter las tortas por lotes al horno.
Y lo más importante saber cuando sacarlas.
En este ejercicio debes buscar que el diseño de tu código siga el principio de "Single Responsibility" (SRP). Esta vez no sólo en los métodos sino también en las clases.

SRP es una de las reglas descritas por Uncle Bob (Robert Martin) con el objetivo de que al hacer cambios en tu código modifiques el menor número de partes.

Esto genera que el costo de mantenimiento sea muy bajo.

Objetivos Académicos
Practicar:

Programación orientada a objetos.
Relación entre clases.
El principio de "Single Responsability".
Actividades
Diseñar un MVP
¿Qué clases crees que sean necesarias?
¿Qué atributos deben tener las clases?
¿Cuál es el comportamiento necesario para cada una?
¿Cómo van a interactuar las clases entre ellas?
¿Cómo divides el código para que cada clase y método tenga una única responsabilidad?
Finalmente debes de tener una idea general de cuáles son los features indispensables para crear el MVP.

Te recomendamos que empieces creando la funcionalidad para que puedas meter y sacar tortas del horno.

Paso 2
Piensa en cómo puedes hacer para meter varias tortas con tiempos diferentes de horneado.

Implementa una manera para saber en que etapa del horneado se encuentra cada tipo de torta. Puedes usar los siguientes estados: crudo, casi listo, listo y quemado.

Paso 3: Refactorizar
Vuelve a leer tu código y revisa que siga los siguientes principios:

¿Tu código es DRY?
¿Tus clases siguen la Ley de Demeter?
¿Tus clases son ortogonales?
¿Estás definiendo correctamente tus métodos públicos y privados?
En resumen la Ley de Demeter es:

Usar métodos de los objetos que llegaron como argumentos del mismo método.
Usar métodos de los objetos que se definieron como variables de la clase.
Usar métodos de los objetos que se definieron como variables locales dentro del método.
Ponte creativo y expande tu programa
Imagínate que otras características pudieras necesitar en una tortería.
=end
class Torta
  attr_reader :sabor

  def tiempode_coccion
    case @sabor
    when :hawaiana
      @coccion = 2
    when :pastor
      @coccion = 10
    when :mole
      @coccion = 8
    end
  end

  def initialize(sabor)
    @sabor = sabor
  end
end

class Horno
  attr_reader :relog

  def initialize
    @relog = 0
    @tortasen_elhorno = []
  end
  def meter_tortas=(orden)
    @tortasen_elhorno = orden
  end
  def enuso?
    @relog += 1
    @tortasen_elhorno.length > 0 ? true : false
  end

  def sacartortas_listas
    r = tortas_listas
    @tortasen_elhorno -= r if r.nil? == false
    r
  end
  def tortas_listas
    r = @tortasen_elhorno.select {|torta| torta.tiempode_coccion == @relog}
    r.empty? ? nil : r
  end
  def tortas_crudas
    r = @tortasen_elhorno.select {|torta| torta.tiempode_coccion > @relog}
    r.empty? ? nil : r
  end
  def tortascasi_listas
    r = @tortasen_elhorno.select {|torta| torta.tiempode_coccion - 1 == @relog}
    r.empty? ? nil : r
  end
end

horno = Horno.new
tortas_listas = []

#obtener las tortas
orden = [:mole, :hawaiana, :pastor, :mole]
#preparar tortas
orden.collect! { |sabor| Torta.new(sabor) }
#meter tortas al horno
horno.meter_tortas = orden
#Sacar tortas cuando esten listas y sabrosas
tortascasi_listas = 0
while horno.enuso?
  tortas_listas << horno.sacartortas_listas
  horno.tortascasi_listas.nil? ? tortascasi_listas = 0 : tortascasi_listas = horno.tortascasi_listas.length
  horno.tortas_crudas.nil? ? tortas_crudas = 0 : tortas_crudas = horno.tortas_crudas.length
  puts "Horno trabajando han pasado #{horno.relog} horas. Tenemos #{tortas_crudas} T. crudas y #{tortascasi_listas} T. casi listas"
end

tortas_listas.compact!.flatten!
tiposde_tortas = tortas_listas.group_by {|torta| torta.sabor}

puts "Se sirvieron #{tortas_listas.length} tortas"
puts "#{tiposde_tortas[:mole].length} de mole, #{tiposde_tortas[:hawaiana].length} de hawaiana y #{tiposde_tortas[:pastor].length} de pastor"
