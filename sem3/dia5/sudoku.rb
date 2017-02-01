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

  def initialize(cols,str)
    @cols = cols
    @rows = str.length / cols - 1
    format_str(str)
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
    #get vertical coords
    tblcoordinates = []
    for i in 0..cols
      tblcoordinates << (0..@rows).to_a.product([i])
    end
    vcoordinates = get_coordinates(tblcoordinates)

    # get horizontal coords
    tblcoordinates = []
    for i in 0..@rows
      tblcoordinates << [i].product((0..cols).to_a)
    end
    hcoordinates = get_coordinates(tblcoordinates)

    #get squere coordinates
    get_sqrcoordinates; exit
    #solve!({horizontal: hcoordinates, vertical: vcoordinates, squer: sqrcoordinates})
  end

  def get_sqrcoordinates
    @tbls[:notformated].each do |item|
      p item
    end
  end

  def get_coordinates(tblcoordinates)
    word = {str: [], array: []}
    result = []

    tblcoordinates.each do |line|

      line.each do |a,b|
        word[:str] << @tbls[:notformated][a][b]
        word[:array] << [a] + [b]
      end
      result << kick_badchars(word) # estoy trabajando aqui
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
    word[:str].each_with_index {|val,index| result << word[:array][index] if val == "0"}
    result
  end

  def format_str(s)
    row_formated = []
    tbl_formated = []
    tbl_notformated = []
    row_notformated = []
    _background = :cyan
    _player_color = :black
    s_ln = s.length - 1

    color_row = 0
    color_col = 0
    color_item = 0

    (0..s_ln).step(@cols) do |line_break|
      s.slice(line_break,@cols).split("").each do |char|

        if color_col == 3
          color_col = 0
          _background = background(_background)
        end
        color_col += 1


        if color_row == 9 || color_row == 18
          _background = :cyan
        elsif color_row == 27 || color_row == 36 || color_row == 45
          _background = :white
        elsif color_row == 54 || color_row == 63 || color_row == 72
          _background = :cyan
        end
        color_row += 1

        _player_color = :black
        _player_color = :red if char == "0"

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
end

board = Board.new(9,'702806519100740230005001070008000002610204053200000100070400800064078005821503907')
board.match_toarray!
puts board
