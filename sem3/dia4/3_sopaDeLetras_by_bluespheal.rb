class Board
# You should put here the given boards templates
# Palabras y Plantillas de Tableros
@@boards_templates = [["POEMA", "CANCION", "RONDAS", "RIMAS"],"POEMAXCXXXXAXXSXNXAAXCMXDXIXXNROXXOXNXXR"]
# [["MANGO", "SANDIA", "MELON", "PLATANO"],"XXXXPXXXXLXAMXAXIEXTXDLXAXNOXNMANGOXSXXX"]
# [["ROJO", "VERDE", "AZUL", "NEGRO"],"OJORXXXXXXXEXXOXDXRXXRGLXXEXUXNVXZXXXXAX"]
#
  def initialize
     complete_board!
  end

  def to_s
    complete_board!
    @nuevo.scan(/.{5}/).map { |x| puts x.split("").map { |x| x.center(4) }.join }
  end

  def soup_finder
    word = 0
    # @@boards_templates[0][word][letter]
    while word < @@boards_templates[0].size
      letter = 0
      # p "si" if x == @@boards_templates[0][word][letter]
      while letter < @@boards_templates[0][word].length
        @@boards_templates[1].split("").each_with_index {|x, index| horizontal(x, index) if x == @@boards_templates[0][word][letter] }
        letter += 1
      end
      word += 1
    end
  end

  private

  def horizontal(value, place)
    p value
    p place
  end

  def complete_board!
    letters = ('A'..'Z').to_a
    @nuevo = @@boards_templates[1].split("").each{|x| x.sub!("X", letters.sample)}.join
  end
end

board = Board.new
 board.to_s
#board.soup_finder
# board.horizontal
