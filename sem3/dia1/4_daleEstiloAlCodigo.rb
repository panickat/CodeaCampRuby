=begin
Dale Estilo Al Código

Un buen programador no solamente escribe código, si no que lo organiza y limpia recurrentemente. Para tener un código digno hay que seguir una serie de convenciones gramaticales y de syntaxis.

Es importante que tu equipo escriba código bajo las reglas de la misma guía de estilo para tener un código unificado. Existen muchas guías de estilo no importa cual utilices siempre y cuando todos en tu equipo utilicen la misma. Piensa que algún día alguien nuevo entrará al equipo o el código será utilizado por otras personas por lo que te recomendamos utilizar Guías de Estilo reconocidas y ampliamente utilizadas.

El objetivo de estas guías es que los programadores de Ruby escriban código al cual puedan dar mantenimiento otros programadores.

Objetivos Académicos
Aprender a limpiar código que no esta del todo bien escrito.
Aprender a escribir código organizado, consistente y de fácil lectura.
Reconocer cuando están mal usadas las convenciones
Arreglar código y que este siga funcionando.
Actividades
Para este ejercicio se te entregará un programa donde el código es un desastre. Utilizando la siguiente Guía de Estilo de Ruby, limpia el código y pon atención en las secciones de Estructura del Código Fuente, Sintaxis, Nombres y Comentarios.

Puedes hacer las modificaciones que gustes al código pero no puedes romper el programa ya que en el drivers code todo debe de a resolverse como verdadero.

Poco de Ayuda
Estructura del Código Fuente
Utiliza dos espacios por cada nivel de identación. No tabs (o configura tus tabs).
No uses ; para separar declaraciones y expresiones. Por convención - utiliza una expresión por línea.
Utiliza espacios entre operadores, después de las comas, dos puntos y puntos y comas. Los espacios en blanco pueden (en su mayoría) irrelevantes para el intérprete de Ruby, pero su uso adecuado es la clave para escribir código fácil de leer.
Sintaxis
Utiliza def con paréntesis cuando tengas argumentos y no dejes espacio entre el nombre del método y el paréntesis, ej. def(argumento)
No uses paréntesis alrededor de la condición
Evita usar return cuando no se requiera en el control de flujo.
Nombres
Utiliza nombres de referencia en Inglés en lo posible.
Utiliza snake_case para los símbolos, métodos y variables.
Utiliza CamelCase para clases y módulos. (Deja en mayúsculas los acrónimos como HTTP, RFC, XML.)
Los nombres de los métodos que afirman (métodos que devuelven un valor booleano) deben terminar con un signo de pregunta. (ejemplo: Array#empty?). Los métodos que no devuelvan un booleano, no deben terminar con un signo de pregunta.
Comentarios
Escribe código autodocumentado e ignora el resto de esta sección. En serio!
Escribe tus comentarios en Inglés para evitar problemas con los caracteres especiales.
Utiliza un espacio entre el primer caracter # del comentario y el texto propio del comentario.
Los comentarios que son más largos que una palabra son capitalizados y usan puntuación.
Generalmente los apuntes se tienen que escribir inmediatamente en la primer línea encima del código a comentar.
La palabra clave del apunte es seguida de dos puntos y un espacio, y luego una nota que describe el problema.
Si se son necesarias varias líneas para describir el problema, las líneas subsiguientes tienen que tener una sangría de dos espacios después del #.
Copia este código en un archivo y arregla el desastre que tiene.
=end
class PERSON
LIFE_stage = {childhood:12,teenager:19,adult:50}
LEGAL_AGE = 18
    attr_reader :name
attr_writer :name

    def initialize ( name,age ); @name = name
        @age = age
    end
    def age
        return @age
end

    def life_stage
if @age < LIFE_stage[:childhood]
            return :childhood
        elsif( @age<LIFE_stage[:teenager])
            return :teenager
        elsif( @age<LIFE_stage[:adult]);return :adult
        else
            return :elder
    end
    end

      def legal
return @age >= LEGAL_AGE
    end
end


# Esta parte del código son pruebas.
# Antes y después deben de imprimir puros "true"
fernando = PERSON.new("Fernando",5)
juan = PERSON.new("Juan",45)
laura = PERSON.new("Laura",87)
andrea = PERSON.new("Andrea",13)

puts fernando.legal == false
puts juan.legal == true
puts laura.legal == true
puts andrea.legal == false

puts fernando.life_stage == :childhood
puts juan.life_stage == :adult
puts laura.life_stage == :elder
puts andrea.life_stage == :teenager

puts laura.age == 87
laura.name = "Ximena"
puts laura.name == "Ximena"
