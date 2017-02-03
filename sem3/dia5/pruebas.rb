# $&	$MATCH	The string matched by the last successful pattern match in this scope.
# $`	$PREMATCH	The string to the left of the last successful match.
# $'	$POSTMATCH	The string to the right of the last successful match.

class Board
  @str_sudoku
  def  initialize(str)
    @str_sudoku = str
  end

  def solve!(debug=false)
    result =* @str_sudoku # =* combierte en array

    result.map do |a|
      i = a =~ /0/ # Regresa la posicion de la cadena buscada -> m1 = /Ruby/.match("El futuro es Ruby") m2 = "El futuro es Ruby" =~ /Ruby/
      v =* (?1..?9)

      if i.nil? == false
        v.fill { |j|
          horizontal = a[j + i - k = i % 9]
          vertical = a[k + j *= 9]
          cuadrante = a[j % 26 + i - i % 3 - i % 27 + k]

          v -= [horizontal, vertical, cuadrante]
          } + v.map { |k| result . << $` << k << $' }
          # Concatenacion: ["z"] . << "a" << "b" => ["z", "ab"]  ##   ["z"] << "a" << "b" => ["z", "a", "b"]   ##   "a" << "b" => "ab"
        end

      end
      @str_sudoku = result.last
    end

    def to_s
      @str_sudoku
    end
  end

  board = Board.new('702806519100740230005001070008000002610204053200000100070400800064078005821503907')
  board.solve!(false)
  puts board
