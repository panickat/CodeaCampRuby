class Sudoku
  ONE_TO_NINE = ("1".."9").to_a

  def initialize(string)
    @string = string
  end

  def row(i)
    row_index = i - i % 9
    current_row = @string[row_index..row_index + 9-1].split("")
    current_row
  end

  def column(i)
    column_index = i % 9
    current_column = []
    9.times do
      current_column << @string[column_index]
      column_index += 9
    end
    current_column
  end

  def cell(i)
    if i <= 26
      cell_index = i - ((i % 3) + ((i / 9)) * 9)
    else
      cell_index = i - ((i % 3) + ((i / 9) % 3) * 9)
    end
    current_cell = (cell_index..cell_index + 2).to_a + (cell_index + 9..cell_index + 11).to_a + (cell_index + 18..cell_index + 20).to_a
    current_cell.map { |x| @string[x] }
  end

  def solve!
    exit = true
    while exit == true
      exit = false
      @string.split("").each_with_index do |x, i|
        if x == "0" && (ONE_TO_NINE - column(i) - row(i) - cell(i)).length == 1
          @string[i] = (ONE_TO_NINE - column(i) - row(i) - cell(i))[0]
          exit = true
        end
      end
    end

  end

  def board
    puts "Game Solved!"
    puts "-" * 21
    print @string.split("").map { |x| x.ljust(2) }.join.scan(/.{1,6}/).join("| ").scan(/.{1,72}/).join("\n- - - - - - - - - - - \n").scan(/.{1,24}/).join("\n")
    puts "\n" + "-" * 21
  end

end

game = Sudoku.new('702806519100740230005001070008000002610204053200000100070400800064078005821503907')

game.solve!
puts game.board
