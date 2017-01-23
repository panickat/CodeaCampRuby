=begin
Abuelita Sordita

Muchas veces como programador te pedirán que modeles algún proceso o situación real en código. Esta vez tendrás que modelar y replicar la interacción de dos personas. La situación es la siguiente.

Modela una interacción entre una persona y su abuela que esta un poco sorda. Para esto tendrás que echar a volar tu imaginación y seguir las siguientes pautas.

Como la abuela esta sorda cualquier cosa que le digas ella responderá gritando "HUH?! NO TE ESCUCHO, HIJO!"
Si gritas para intentar que te escuche, lo va a entender mal y responderá gritando "NO, NO DESDE 1983"
Para poder irte y dejar de hablar con ella tendrás que con mucho amor decir "BYE TQM"
Al modelar este tipo de situaciones siempre es bueno pensar muy bien como vas a modelar estas interacciones, y comparar la realidad con el código: por ejemplo correr el programa sería como llegar a platicar con tu abuelita. Cuando utilizas el método gets para recibir input desde la consola sería como decirle algo a tu abuelita y ella contestaría usando un print a la pantalla. El uso de minusculas y mayusculas puede darle sentido a el tono con el que hablas. Finalmente piensa como finalizas el programa o en realidad dejas de hablar con ella.

Objetivos Académicos
Control del Flujo del Código
Uso de condicionales
Uso de variables
Conocer un método para recibir input del usuario
Implementar el principio de "Single Responsibility" en tus métodos
Actividades
Crea un método llamado deaf_grandma que modele la interacción antes mencionada.

Una vez que hayas acabado refactoriza el código. Analiza si únicamente escribiste un método que modela toda la interacción o si descompusiste tu código para crear unidades lógicas más pequeñas. Si únicamente tienes un método intenta descomponerlo en unidades más pequeñas.

El principio de "Single Responsibility" enfocado en métodos, busca que cada método resuelva una sola responsabilidad de tu programa. De esta manera tendrás más control sobre el funcionamiento de cada uno de ellos y será más fácil encontrar errores. Ya que al encapsular pedazos de código quedan aislados y pueden ser analizados por separado. Otro beneficio es que al ser unidades aisladas pueden re usarse dentro del programa.

Vamos a elevar la dificultad.
Ahora en tu programa adicional a que puedas acabar la conversación diciendo "BYE TQM", podrás dejar de hablar con ella solamente si dices tres veces "BYE TQM".
=end
class Abuelita
def initialize
  @prompt = "Platica con tu abuelita > "
  print @prompt
end
def deaf_grandma
  count_bye = 0
  return if count_bye >= 3

  while count_bye <= 3 do
    break if count_bye == 3
    _grandson_answer = gets.chomp
    if _grandson_answer.upcase == "BYE TQM" && is_upper?(_grandson_answer)
      count_bye += 1
      @prompt = "a #{3 - count_bye} BYE TQM para salir. Platica con tu abuelita > "
    else
      puts grandma_answer(_grandson_answer)
    end
    print @prompt
  end
end
def grandma_answer(str)
  is_upper?(str) ? "NO, NO DESDE 1983" : "HUH?! NO TE ESCUCHO, HIJO!"
end
def is_upper?(s)
  s == s.upcase ? true : false
end
end

abue = Abuelita.new
abue.deaf_grandma
