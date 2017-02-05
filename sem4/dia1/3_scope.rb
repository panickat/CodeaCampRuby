=begin
Scope

Para poder hacer este ejercicio deberás estar familiarizado con los siguientes conceptos.

Local and Global Scope
Clases and Instances
The initialize method
Type of Variables
Getters y setters
Este ejercicio simplemente te ayudara a practicar estos conceptos para que queden más claros. Recuerda que echando a perder se aprende.

En Ruby el Scope de una variable es una de sus propiedades y se refiere al alcance dentro de un contexto especifico del programa. En otras palabras la definición de una variable será verdadera o podrá ser utilizada dentro de uno o varios contextos del programa, según sea su alcance.

Existen diferentes tipos de variables dependiendo de su scope. Veremos la diferencia de cada una, sus propiedades y como se deben de utilizar.

Local Variables
Global Variables
Class Variables
Instance Variables
CONSTANTS
Recursos Externos
"Programming Ruby - The Pragmatic Programmer's Guide" aka "Pickaxe" : Chapter 22 - "Variables and Constants"
En este ejercicio jugaremos con todas estas varaiables para que puedas comprender el concepto de scope.

Objetivos Académicos
Comprender el concepto de scope
Conocer los diferentes tipos de variables y su uso adecuado
Comprender el concepto de clase y de instancia
Conocer también los métodos de instancia y de clase
Actividades
Local Variables within the Global Scope
Crea una variable en el global_scope llamada local_var con el valor "this is my local var" después crea un método llamado return_my_local_var, este método deberá regresar simplemente local_var. Has un puts del método return_my_local_var.

Escribe una explicación de que esta pasando y porque obtuviste ese resultado. Para hacer las cosas más claras dentro del método return_my_local_var cambia el valor de la variable.

Te das cuenta como aunque tengas la misma variable en realidad son dos con el mismo nombre. La diferencia es que una pertenece al contexto global y la otra al contexto local de un método.

Local Variables within a Class
Ahora encierra este código dentro de una clase llamada DummyClass, crea una instancia de esta clase y manda a llamar su método return_my_local_var y has un puts de lo que regresa. Que pasa?

Encierra la definición de local_var dentro del método initialize para que esta variable pertenezca a cada instancia creada. Recuerda que este método corre cada vez que se crea una nueva instancia. Que pasa ahora?

Por ultimo convierte local_var en una variable de instancia llamada @instance_var. Supongo que tus problemas se han arreglado. Escribe una nota de para que sirven las variables de instancia con lo que aprendiste.

Getter y Setters
Estos son métodos que se utilizan para poder leer y reescribir una variable de instancia. Agrega estos métodos a tu clase. Uno de ellos ya lo tienes.

Aquí los métodos empiezan con get y set, esto simplemente es únicamente para comprender cada uno por convención simplemente deben llamarse @instance_var y @instance_var=.

# Este es un getter
  def instance_var
    @instance_var
  end

# Este es un setter
  def instance_var=(value)
    @instance_var = value
  end
Los setters por convención siempre se escriben con un = al final dando a entender que ese método sobre-escribe una variable. Además esa sintaxis permite utilizarlos de las siguientes dos formas.

p dummy_class.instance_var=("Bar")
p dummy_class.instance_var   =    "Baz"
Class Variables
Dentro de tu clase DummyClass en la parte de arriba define la siguiente variable de clase:

@@class_variable = "This is a class variable"
Crea un setter y un getter y sigue estos pasos para comprender el comportamiento de estas variables.

Crea una instancia de DummyClass guardándola como dummy_1
Crea otra instancia de DummyClass guardándola como dummy_2
Imprime el valor de dummy_1.class_variable y de dummy_2.class_variable. Son iguales?
Cambia el valor de dummy_1.class_variable = "New value for the class variable".
Vuelve a Imprimir el valor de dummy_1.class_variable y de dummy_2.class_variable. Son iguales?
Comprendiste lo que paso? si no te ha quedado claro repite esos pasos pero con @instance_var.

Global variables and constants
Fuera de la clase en el alcanze global crea las siguientes variables:

$global_var = "This is a global variable"
CONSTANT = 3.1416
Aunque parezca repetitivo crea setters y getters para las dos variables dentro del alcance global y luego repite lo mismo dentro de la clase.

Ahora juega haciendo cambios de estas variables tanto globalmente como por medio de una instancia.Si recibiste algún error? busca que quiere decir dicho error.

Puedes definir un setter para la constante?
Llama los getters del alcance global de las dos variables
Modifica el valor de la variable global dentro del alcance global
Crea una instancia de DummyClass guardándola como dummy_1
Llama los getters por medio de esta instancia de las dos variable
Modifica por medio de esta instancia la variable global y luego llama su getter global.
=end
p "****Ejersicio 1"
local_vars = "this is my local var"
def return_my_local_var
  begin
    local_var
  rescue Exception => e
    puts "#{e}"
    puts "Genera un error: por que el metodo no ve la variable de arriva \n que ya esta declarada!, esto quiere decir que anvas variables son locales"
  end
end
puts return_my_local_var

p "****Ejersicio 1_b"
def return_my_local_var
  local_var = "var declarada"
end
puts return_my_local_var

p "****Ejersicio 2"
$global_var = "This is a global variable"
CONSTANT = 3.1416

class DummyClass
  @@class_variable = "This is a class variable"

  def initialize
    @instance_var = "this is my local var"
  end
  def return_my_local_var
    puts "Ya no genera error por que @instance_var se declaro en el initialize en todas las nuevas instancias"
    @instance_var
  end
  def class_variable=(value)
     @@class_variable = value
  end
  def class_variable
    @@class_variable
  end
  # Ejersicio 4
  def global_var
    $global_var
  end
  def global_var=(var)
    $global_var = var
  end
  # Error
  # def constant=(var)
  #   CONSTANT = var
  # end
  def global_var
    $global_var
  end
  def constant
    CONSTANT
  end
end

dummy_class = DummyClass.new
puts dummy_class.return_my_local_var

p "****Ejersicio 3"
dummy_1 = DummyClass.new
dummy_2 = DummyClass.new

p dummy_1.class_variable
p dummy_2.class_variable

p "Se cambio el valor de la variable de clase"
dummy_1.class_variable = "New value for the class variable"
p dummy_1.class_variable
p dummy_2.class_variable

p "****Ejersicio 4"
def global_var
  $global_var
end
def constant
  CONSTANT
end
p "Puedes definir un setter para la constante? Nop!"
p "Llama los getters del alcance global de las dos variables"
p global_var
p constant
p "Modifica el valor de la variable global dentro del alcance global"
$global_var = "tocino global"
p global_var
p "Crea una instancia de DummyClass guardándola como dummy_1"
dummy_1 = DummyClass.new
p "Llama los getters por medio de esta instancia de las dos variable"
dummy_1.global_var = "global change from instance"

p dummy_1.global_var
p dummy_1.constant
