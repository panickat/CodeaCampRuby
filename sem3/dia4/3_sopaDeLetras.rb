=begin
Sopa De Letras

Para este ejercicio crearemos el juego de sopa de letras. Aunque parece fácil puede llegar a ser algo complicado.

La sopa de letras es un juego que consiste en descubrir dentro de un tablero de letras un número determinado de palabras, enlazando estas letras de forma horizontal, vertical o diagonal y en cualquier sentido, tanto de derecha a izquierda como de izquierda a derecha, y tanto de arriba a abajo, como de abajo a arriba.

Enlaces Externos

Juega Sopa de Letras en Internet
Este método puede servirte para mejorar la representación gráfica del tablero.String#ljust
Objetivos Académicos
Modelar una solución dinámica para un juego real
Comprender la diferencia de la representación interna a externa
Conocer el método to_s
Actividades
Antes de empezar tienes que estar seguro que comprendes el juego y que tienes un proceso para resolverlo.

Divide y vencerás: dividiremos en nuestro problema en partes más pequeñas para simplificar su dificultad.

El Tablero
Sigue la estructura que se te da para ir acostumbrándote a crear clases e ir organizando y encapsulando tu código. Utiliza estos tableros donde ya están distribuidas algunas palabras, solo hay que adecuarlos.

Nuestros tableros serán de 8x5. 8 Filas y 5 Columnas.

# Palabras y Plantillas de Tableros
[["POEMA", "CANCION", "RONDAS", "RIMAS"],"POEMAXCXXXXAXXSXNXAAXCMXDXIXXNROXXOXNXXR"]
[["MANGO", "SANDIA", "MELON", "PLATANO"],"XXXXPXXXXLXAMXAXIEXTXDLXAXNOXNMANGOXSXXX"]
[["ROJO", "VERDE", "AZUL", "NEGRO"],"OJORXXXXXXXEXXOXDXRXXRGLXXEXUXNVXZXXXXAX"]
class Board
# You should put here the given boards templates
# @@boards_templates =
  def initialize
     complete_board!
  end

  def to_s
    "try to print a board, what does this method do?"
  end

  private

  def complete_board!
        #Este método debe rellenar un tablero incompleto, en otras palabras cambiar las "x" por letras random.
  end
end

board = Board.new
puts board
El método to_s es el símil del método toString de otros lenguajes de programación. Este método se utiliza para que nos devuelva una cadena de texto, que suele ser la información más relevante del objeto. Este método lo heredan todas las clases de la clase objeto. Si haces un clase Dog vacía y llamas puts en una de sus instancias regresará #<Dog:0x007ffd389b7930>. Tu puedes re-definir este método y en nuestro caso, deberá regresar una representación gráfica de nuestro tablero.

La Solución
Ya que tenemos el tablero creado, debemos crear un método que verifique si una palabra se encuentra dentro del tablero. Esto no será fácil, recuerda que existen varias maneras diferentes en las que una palabra puede estar escrita.

Te recomiendo jugar sopa de letras e ir apuntando el proceso por el cual comienzas a buscar una palabra, paso por paso. Después de tener estos pasos deberás crear el pseudocódigo.

Una vez que tengas el pseudocódigo ahora simplemente hay que empezar a escribir el código. Escribe un método llamado include?(word).

Consejos
Pregúntate cual es la manera más fácil en la que puedes guardar tu tablero (string, array, nested-array).
Refactoriza tu código, estarás realizando una y otra vez procesos muy similares, lo único que cambiará será el orden de los datos.
=end
class Cuadricula
  def formato(str,_player_color,_background)
    str.ljust(3).colorize(_player_color).colorize( :background => _background)
  end
  def background(_background)
    _background == :cyan ? :white : :cyan
  end
  def player_color(_player_color)
    _player_color == :black ? :red : :black
  end
end

class Board < Cuadricula
  require "colorize"

  def initialize(cols,a)
    @array_tomatch = a[0]
    @cols = cols
    @rows = a[1].length / cols - 1
    format_str(complete_board(a[1]))
  end

  def to_s
    "try to print a board, what does this method do?"
    #format_str(@board_template[1]).inject {|memo,sum| memo + sum +["\n"] }.join # La ultima linea no suma salto de linea
    out = ""
    @tbls[:formated].each {|line| out += line.join + "\n"}
    puts " "
    out
  end
  def match_toarray!
    cols = @cols - 1
    # get vertical coords
    tblcoordinates = []
    for i in 0..cols
      tblcoordinates << (0..@rows).to_a.product([i])
    end
    tblcoordinates = get_coordinates(tblcoordinates)
    merge_tblcoords(tblcoordinates)

    # get horizontal coords
    tblcoordinates = []
    for i in 0..@rows
      tblcoordinates << [i].product((0..cols).to_a)
    end
    tblcoordinates = get_coordinates(tblcoordinates)
    merge_tblcoords(tblcoordinates)

    # get diagonal asc coords
    tblcoordinates = []
    rango = cols + @rows # sobra en el array un 7 , pendiente restar a @rows a - 1
    for i in 1..rango
      i <= @rows ? x = i : x = @rows
      i <= cols ? y = 0 : y += 1

      i <= @rows ? x2 = 0 : x2 += 1
      i <= cols ? y2 = i : y2 = cols

      xitem = x
      yitem = x2
      a = []
      while xitem >= y
        a << [xitem, yitem]
        xitem -= 1
        yitem += 1
      end
      tblcoordinates << a
    end
    tblcoordinates.pop # sobra ultimo elemento , ver si se puede reducir @rows a -1
    tblcoordinates = get_coordinates(tblcoordinates)
    merge_tblcoords(tblcoordinates)
  end

  def get_coordinates(tblcoordinates)
    word = {str: [], array: []}
    result = []

    tblcoordinates.each do |line|

      line.each do |a,b|
        word[:str] << @tbls[:notformated][a][b]
        word[:array] << [a] + [b]
      end

      result << kick_badchars(word) if include?(word[:str].join) == true
      word = {str: [], array: []}
    end
    result
  end
  def merge_tblcoords(tbl_tomerge)
    tbl_tomerge.flatten(1).each do |x,y|
      @tbls[:formated][x][y] = @tbls[:formated][x][y].sub("31","93").sub("30","93")
    end
  end

  def kick_badchars(word)
    result = []
    @array_tomatch.each do |original|
      if word[:str].join.include?(original)

        original_array = original.split("")
        start_from = word[:str].join.index(original[0])
        index_original = 0
        for index_word in start_from..word[:str].join.length - 1
          result << word[:array][index_word] if original_array[index_original] == word[:str][index_word]
          index_original += 1
        end
      elsif word[:str].join.include?(original.reverse)
        original.reverse!
        original_array = original.split("")
        start_from = word[:str].join.index(original[0])
        index_original = 0
        for index_word in start_from..word[:str].join.length - 1
          result << word[:array][index_word] if original_array[index_original] == word[:str][index_word]
          index_original += 1
        end
      end
    end
    result
  end

  def include?(word)
    @array_tomatch.any? {|w| word.include?(w) || word.reverse.include?(w)}
  end
  def format_str(s)
    row_formated = []
    tbl_formated = []
    tbl_notformated = []
    row_notformated = []
    _background = :cyan
    _player_color = :black
    s_ln = s.length - 1

    (0..s_ln).step(@cols) do |line_break|
      s.slice(line_break,@cols).split("").each do |char|

        _background = background(_background)
        _player_color = player_color(_player_color)

        row_formated << formato(char, _player_color, _background) #+ "\n"
        row_notformated << char

      end
      tbl_formated << row_formated
      tbl_notformated << row_notformated
      row_formated = []
      row_notformated = []
    end
    @tbls = {formated: tbl_formated, notformated: tbl_notformated}
  end

  private

  def complete_board(board_line)
    #Este método debe rellenar un tablero incompleto, en otras palabras cambiar las "x" por letras random.
    shuffle = ("A".."Z").to_a.shuffle
    board = board_line.split("")
    while board.include?("X") == true
        board[board.index("X")] = shuffle.sample
    end
    board_line = board.join
  end

end

board = Board.new(5,[["POEMA", "CANCION", "RONDAS", "RIMAS"],"POEMAXCXXXXAXXSXNXAAXCMXDXIXXNROXXOXNXXR"])
puts board
board.match_toarray!
puts board
board = Board.new(5,[["MANGO", "SANDIA", "MELON", "PLATANO"],"XXXXPXXXXLXAMXAXIEXTXDLXAXNOXNMANGOXSXXX"])
puts board
board.match_toarray!
puts board
board = Board.new(5,[["ROJO", "VERDE", "AZUL", "NEGRO"],"OJORXXXXXXXEXXOXDXRXXRGLXXEXUXNVXZXXXXAX"])
puts board
board.match_toarray!
puts board
