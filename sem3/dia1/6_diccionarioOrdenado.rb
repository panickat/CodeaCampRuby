=begin
Diccionario Ordenado

En este ejercicio deberás crear un programa que ordene una lista de palabras las cuales serán capturadas por el usuario.

Se debería ver algo como esto:

> Escribe una palabra:
> Gato
> Escribe otra palabra(o presiona "enter" para finalizar):
> Lechuga
> Escribe otra palabra(o presiona "enter" para finalizar):
> Rojo
> Escribe otra palabra(o presiona "enter" para finalizar):
> Silla
> Escribe otra palabra(o presiona "enter" para finalizar):
> Armadillo
>
> Felicidades! Tu diccionario tiene 5 palabras:
> Armadillo
> Gato
> Lechuga
> Rojo
> Silla
Objetivos Académicos
Utilizar el input del usuario
Guardar y acceder datos desde un "data structure" (array)
Comprender que existen diferentes formas de ordenar datos
Investigar y comprender diferentes Ruby Buil-in Mehtods utilizando ruby docs
Comprender como las minúsculas y mayúsculas son tratadas en un orden alfabético
Actividades
Escribe un programa llamado diccionary_sort que pida al usuario capturar las palabras que quiera (una palabra por línea) y para finalizar la captura tenga que presionar "enter".

Deberás utilizar un array para guardar las palabras.

Una vez que el usuario presiona "enter" el programa deberá arrojar la lista de palabras en orden alfabético.

Pregúntate:
Que pasará si el usuario captura un número o un string vacío. Como puedes solucionarlo.

Vamos a elevar la dificultad.
Modifica el programa para que ignore el orden si el usuario capturó las palabras en mayúsculas o minúsculas, pero al enlistarlas deberá mantener su formato.
=end
class DiccionarySort
  @@salto_linea = '> Escribe otra palabra(o presiona "enter" para finalizar):'
  @@prompt = "> "

  def initialize
    puts "> Escribe una palabra:"
    print @@prompt
  end
  def add_word
    end_program(text_loop)
  end
  def text_loop
    str = gets.chomp
    dictionary = []
    while str != ""
      if str != "" && is_numeric?(str) == false
        dictionary << str.capitalize
        puts @@salto_linea
        print @@prompt
        str = gets.chomp
      elsif is_numeric?(str)
        puts "> Esto es un numero. Escribe una palabra:"
        print @@prompt
        str = gets.chomp
      end
    end
    dictionary
  end
  def end_program(a)
    puts "your dictionary contain:"
    a.sort.each do |e|
      puts e
    end
  end
  def is_numeric?(i)
    n = Integer(i) rescue false
    n == false ? false : true
  end

end
diccionario = DiccionarySort.new
diccionario.add_word
