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
    for i in 0..cols
      tblcoordinates << [i].product((0..cols).to_a)
    end
    tblcoordinates = get_coordinates(tblcoordinates)
    merge_tblcoords(tblcoordinates)

    # get diagonal asc coords
    #p cols; p @rows; exit
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
