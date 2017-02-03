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
    out = ""
    #format_str(@board_template[1]).inject {|memo,sum| memo + sum +["\n"] }.join # La ultima linea no suma salto de linea
    @tbls[:formated].each {|line| out += line.join + "\n"}
    out
  end
  def solve!
    l = 0
    while l < 100
      l += 1
      get_structure
      puts to_s
      p "************* #{l} *************"
      gets.chomp
    end
  end

  def get_sqrcoordinates
    #Bug: Este metodo solo funciona en 9x9. Pendiente implementar multi dimension
    sqr0, sqr1, sqr2, sqr3, sqr4, sqr5, sqr6, sqr7, sqr8 = [], [], [], [], [], [], [], [], []
    char_count = 0
    sqrs = {sqr0: [], sqr1: [], sqr2: [], sqr3: [], sqr4: [], sqr5: [], sqr6: [], sqr7: [], sqr8: []}
    tblrows = @tbls[:notformated].length - 1
    tblcols = @tbls[:notformated][0].length - 1

    for x in 0..tblrows
      for y in 0..tblcols

        char_count += 1
        case char_count
        when 1..3, 10..12, 19..21
          sqrs[:sqr0] << [x,y]
        when 4..6, 13..15, 22..24
          sqrs[:sqr1] << [x,y]
        when 7..9, 16..18, 25..27
          sqrs[:sqr2] << [x,y]
        when 28..30, 37..39, 46..48
          sqrs[:sqr3] << [x,y]
        when 31..33, 40..42, 49..51
          sqrs[:sqr4] << [x,y]
        when 34..36, 43..45, 52..54
          sqrs[:sqr5] << [x,y]
        when 55..57, 64..66, 73..75
          sqrs[:sqr6] << [x,y]
        when 58..60, 67..69, 76..78
          sqrs[:sqr7] << [x,y]
        when 61..63, 70..72, 79..81
          sqrs[:sqr8] << [x,y]
        end
      end
    end
    sqrs
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
    result#.reject {|r| r.empty? == true}
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
  def get_structure
    cols = @cols - 1
    #get vertical coords
    vwhole = []
    for i in 0..cols
      vwhole << (0..@rows).to_a.product([i])
    end
    vmiss =  get_coordinates(vwhole)

    # get horizontal coords
    hwhole = []
    for i in 0..@rows
      hwhole << [i].product((0..cols).to_a)
    end
    hmiss = get_coordinates(hwhole)

    #get squere coordinates 3x3
    swhole = []
    get_sqrcoordinates.each {|sqr| swhole << sqr[1]}
    smiss = get_coordinates(swhole)

    gettrys({hmiss: hmiss, vmiss: vmiss, smiss: smiss, vwhole: vwhole, swhole: swhole })
  end
  # only 9x9
  # ******************** ******************** algorithm Methods ******************** ********************
  def getline_fromcoords(array)
    array.collect {|x,y| @tbls[:notformated][x][y].to_i}
  end

  def lowerabsent(tbl, ttype = "h")
    result = []
    case ttype
    when "h", "v"
      absent = 9
    when "s"
      absent = 3
    end

    tbl.each_with_index do |line, i|
      next if line.empty? == true

      if line.length <= absent
        absent = line.length
        case ttype
        when "h"
          result << {hindex: i, coords: line}
        when "v"
          result << {vindex: i, coords: line}
        when "s"
          result << {sindex: i, coords: line}
        end
      end
    end
    arraymin = result.group_by {|g| g[:coords].length}
    min = arraymin.collect {|x,y| x }.min
    arraymin[min]
  end

  def missto_n(index, tbl = [], ttype = "h")
    case ttype
    when "h"
      list = [1,2,3,4,5,6,7,8,9] - @tbls[:notformated][index].map(&:to_i)
    when "v", "s"
      list = [1,2,3,4,5,6,7,8,9] - getline_fromcoords(tbl[index])
    end
    list.select! {|n| n > 0}

    case ttype
    when "h"
      {hindex: index, numbers: list}
    when "v"
      {vindex: index, numbers: list}
    when "s"
      {sindex: index, numbers: list}
    end
  end
  def locatecoord_onsquere(coords_absent,stbl)
    result = []
    stbl.each_with_index do |sqr, sindex|
      coords_absent.each do |item|
        item[:coords].each do |coord|
          found = sqr.index(coord)
          result << {item.keys[0] => item[item.keys[0]], sindex: sindex, coord: coord,} if found.nil? == false
        end
      end
    end
    result
  end
  # ******************** ******************** algorithm to solve! ******************** ********************
  # tcoords[:xmiss] -> tablas en coordenadas con numeros faltantes , tcoords[:xwhole] -> tablas completas en coordenadas
  def gettrys(tcoords)
    # Indexa coordenadas de las lineas con menor incognitas
    p "hmiss............"
    p tcoords[:hmiss]
    hlower_c = lowerabsent(tcoords[:hmiss]) # [{:hindex=>x, :coords=> [[]]
    vlower_c = lowerabsent(tcoords[:vmiss],"v") # [{:vindex=>x, :coords=>[[]]
    slower_c = lowerabsent(tcoords[:smiss],"s") # [{:sindex=>x, :coords=>[[]]

    # combierte las coordenadas en numeros -> contiene menor incognitas
    hlower_n = hlower_c.collect {|line| missto_n(line[:hindex])} # [{:hindex=>0, :numbers=>[3, 4]}, x]
    vlower_n = vlower_c.collect {|line| missto_n(line[:vindex],tcoords[:vwhole], "v")} # [{:vindex=>0, :numbers=>[3, 4]}, x]
    #slower_n = slower_c.collect {|line| missto_n(line[:sindex], tcoords[:swhole], "s")} # [{:sindex=>2, :numbers=>[4, 6, 8]}, x]
    p "****** H vs V *******"
    p hlower_c.length < vlower_c.length ?  "h < v" : "h > v"
    # cantidad de incognitas decide si se usa h o v
    p lower_c = hlower_c.length < vlower_c.length ?  hlower_c : vlower_c
    lower_n = lower_c[0].keys[0][0] == "h" ? hlower_n : vlower_n
    # le pone cuadro a cada coord y separa coordenadas, una por linea
    hvindex_sindex_coords = locatecoord_onsquere(lower_c, tcoords[:swhole])
    sqr_n = hvindex_sindex_coords.collect {|item| missto_n(item[:sindex], tcoords[:swhole],"s")}
    # buscar que sqr tiene menos coincidencias
    hvindex_sindex_coords.collect { |main|
      main[:sqr_options] = sqr_n.collect {|numbers| numbers[:numbers] if main[:sindex] == numbers[:sindex] }.compact.flatten
      main[:options] = lower_n.collect {|numbers| numbers[:numbers] if main[main.keys[0]] == numbers[numbers.keys[0]] }.compact.flatten
      main[:reduce] = main[:options] - ([1,2,3,4,5,6,7,8,9] - main[:sqr_options])

    }
    # numbers[:numbers] if main[main.keys[0]] == numbers[numbers.keys[0]]
    result = hvindex_sindex_coords.group_by {|g| g[:reduce].length}

    p "*******start Result"
    reduce_index = result.collect {|x,y| x }.min
    result[reduce_index].map {|e| p e} # inspect
    result[reduce_index].map do |item|

       case item.keys[0][0]
       when "h"
         if item[:reduce].length == 1
         x = item[:coord][0]
         y = item[:coord][1]
         @tbls[:notformated][x][y] = item[:reduce][0]
         @tbls[:formated][x][y] = formato(@tbls[:notformated][x][y].to_s,:red, :yellow)
       elsif item[:reduce].length > 1
         # Pregunta en linea vertical
       end
       when "v"
         p "################## - caso vertical pendiente - ###################"; exit
       end

    end

  end
end
board = Board.new(9,'702806519100740230005001070008000002610204053200000100070400800064078005821503907')
board.solve!
