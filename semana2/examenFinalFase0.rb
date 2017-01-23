# Crea el método vowels que recibe una lista de palabras words y remueve las vocales de cada string. Haz pasar la prueba correspondiente.
def vowels(a); a.collect {|c| c.gsub(/[aeiou]/,"")} end
p "Removiendo vocales"
p vowels(["banana", "carrot", "pineapple", "strawberry"]) == ["bnn", "crrt", "pnppl", "strwbrry"]

#Dados dos números, que pueden ser positivos y negativos, encuentra la suma de todos los números entre ellos, incluyendo esos números también. Si los dos números son iguales, regresa alguno de los dos.
def get_sum(a,b); a < b ? (a..b).reduce(:+) : (b..a).reduce(:+) end
p "***** Suma de números *****"
p get_sum(1, 0) == 1
p get_sum(1, 2) == 3
p get_sum(0, 1) == 1
p get_sum(1, 1) == 1
p get_sum(-1, 0) == -1
p get_sum(-1, 2) == 2

#Crea un método que reciba una oración y regrese un string señalándonos el número de palabras y caracteres que contiene, sin contar los espacios en blanco, tu método deberá pasar las siguientes pruebas:
def char_word_counter(str)
  words,chards = 0,0
  str.split(" ").each {|e| words += 1; chards += e.length}
  "This sentence has #{words} words & #{chards} characters"
end
puts "***** Palabras y caracteres *****"
p char_word_counter("This is a sentence") == "This sentence has 4 words & 15 characters"
p char_word_counter("This easy") == "This sentence has 2 words & 8 characters"
p char_word_counter("This is a very complex line of code to test our program") == "This sentence has 12 words & 44 characters"
p char_word_counter("And when she needs a shelter from reality she takes a dip in my daydreams") == "This sentence has 15 words & 59 characters"

#Ahora vamos a aprovechar los Hashes como herramienta de organización para distinguir alimentos por grupo alimenticio. Para esto deberás generar un método que tome como parámetro un string que contenga una comida, y buscarlo en el siguiente hash, regresando su key como valor de retorno, si no encuentra la comida deberá regresar "comida no encontrada".
# Deberás utilizar este Hash como base de tu programa
def food_group(str)
food_groups = {
    "grano" => ['Arroz','Trigo', 'Avena', 'Cebada', 'Harina'],
    "vegetal" => ['Zanahoria', 'Maíz', 'Elote', 'Calabaza', 'Papa'],
    "fruta" => ['Manzana', 'Mango', 'Fresa', 'Durazno', 'Piña'],
    "carne" => ['Res', 'Pollo', 'Salmón', 'Pescado', 'Cerdo'],
    "lácteo" => ['Leche', 'Yogur', 'Queso', 'Crema']
    }
    a = food_groups.map {|k,v| return k if v.include?(str)}
    "comida no encontrada" if a.compact.empty?
end
puts "***** Buscando en hashes *****"
# Driver code
p food_group('Crema') == "lácteo"
p food_group('Res') == "carne"
p food_group('Piña') == "fruta"
p food_group('Caña')  == "comida no encontrada"

# Define la clase Die. Todos los objetos de esta clase (dados) son creados con un número de lados definido por el usuario. Además define un método roll que sea capaz de lanzar el dado y que regrese un número entre uno y el número de lados del dado. Ten en cuenta que un dado no puede tener un solo lado, notifícale al usuario. Define getters y setters para los lados del dado, y úsalos. No puedes usar los attr_* que nos da Ruby.
class IsInteger
  protected
  def isInteger?(i)
    isInteger = Integer(i) rescue false
    isInteger == false ? false : true
  end
  def getInteger(n)
    correctInput = false
    until correctInput == true do
      correctInput = isInteger?(n)
      if correctInput
        return n.to_i
      else
        print @prompt
        n = gets.chomp
      end
    end
  end

end
class Die < IsInteger
    def initialize
      puts "***** Dado *****"
      @prompt = "¿De cuantos lados quieres tu dado? tiene que ser mayor a 1 > "
      print @prompt
    end
    def side=(n)
      n = getInteger(n)
      until n > 1 do
        print @prompt
        n = getInteger(gets.chomp)
      end
      @n = n
    end
    def side; @n end
    def roll
       puts "El dado rodo y callo con uuuun! #{rand(1..@n)}"
     end
end
#test
dado = Die.new
dado.side = gets.chomp
dado.roll

#Crea una clase llamada MyCar. Cuando inicializas un nuevo objeto de la clase se permite al usuario definir las variables de instancia que nos dicen el año, color y modelo del carro. Crea métodos de instancia que permiten al carro acelerar, frenar y apagar el carro. Haz pasar todas las pruebas correspondientes.
class Getdata
  protected
  def get_data(name)
    print "Escribe el #{name} para tu carro >"
    return gets.chomp
  end
end
class MyCar < Getdata
  def initialize(año=0,color="no_color",modelo="no_model")
    puts "***** Driving *****"
    @año,@color,@modelo,@current_speed = get_data("año"),get_data("color"),get_data("modelo"),0
  end

  def speed_up(kph); @current_speed += kph; "You push the gas and accelerate #{kph} kph." end
  def brake(kph); @current_speed -= kph; "You push the brake and decelerate #{kph} kph." end
  def current_speed; "You are now going #{@current_speed} kph." end
  def shut_down; "Let's shut down to 0!" end
end
carro_prueba = MyCar.new
# Driver code
p carro_prueba.speed_up(20) == "You push the gas and accelerate 20 kph."
p carro_prueba.current_speed == "You are now going 20 kph."
p carro_prueba.speed_up(20) == "You push the gas and accelerate 20 kph."
p carro_prueba.current_speed == "You are now going 40 kph."
p carro_prueba.brake(20) == "You push the brake and decelerate 20 kph."
p carro_prueba.current_speed == "You are now going 20 kph."
p carro_prueba.brake(20) == "You push the brake and decelerate 20 kph."
p carro_prueba.current_speed == "You are now going 0 kph."
p carro_prueba.shut_down == "Let's shut down to 0!"
p carro_prueba.current_speed == "You are now going 0 kph."

=begin Crea la clase Playlist que para inicializarla recibe 2 argumentos: name (nombre del playlist) y songs (lista de canciones).
Crea una forma para poder leer el nombre del Playlist.
Crea el método number_of_songs que regresa el número de canciones que contiene el Playlist.
Crea el método add_song que agrega una canción a la lista.
Crea el método next_song que regresa la siguiente canción del Playlist. Para esto necesitarás llevar control de cuál es la canción actual. Si el playlist se encuentra en la última canción debe de volver a iniciar.

Al crear una nueva instancia de Playlist la canción actual por default debería ser la primera canción de la lista que le pasen.
=end
class Playlist
  attr_reader :name, :songs
  def initialize(name="no_name",songs="no_songs")
    puts "***** Play List *****"
    @name, @songs, @current_song = name,songs,0
  end
  def readPlayList
    puts "La lista '#{@name}' contiene las canciones: "
    i=0
    @songs.each {|e| i +=1; puts "#{i}).- #{e}"}
  end
  def number_of_songs
    puts "La lista '#{@name}' tiene #{@songs.count} canciones"
  end
  def add_song=(song); puts "Se añadio la cacnion con exito" ; @songs << song end
  def next_song
    puts "Se adelanto al siguiente track"
     if @current_song == (@songs.count - 1)
        @current_song = 0
      else
         @current_song += 1
      end
  end
  def current_song
    puts "La cancion actual es: #{@current_song+1}).- #{@songs[@current_song]}"
  end

end

canciones = ["Enter Sandman","Fade to Black","Juana la cubana"]
myPlayList = Playlist.new("Play list Metallcia",canciones)
myPlayList.readPlayList
myPlayList.current_song
myPlayList.number_of_songs
myPlayList.add_song = "Si soy Rebeldeee!"
myPlayList.number_of_songs
myPlayList.next_song
myPlayList.current_song
myPlayList.next_song
myPlayList.current_song
myPlayList.next_song
myPlayList.current_song
myPlayList.next_song
myPlayList.current_song
