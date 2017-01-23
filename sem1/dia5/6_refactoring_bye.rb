=begin
def bye(numbers)
  list = []
  numbers.each do |number|
    if number < 10
      list << "Smaller"
    else
      list << number
    end
  end
  list
end

#test
p bye([2, 4, 6, 10, 20, 40, 76]) == ["Smaller", "Smaller", "Smaller", 10, 20, 40, 76]
=end

def bye(numbers); numbers.map! {|n| n<10 ? n="Smaller" : n } end

#test
p bye([2, 4, 6, 10, 20, 40, 76]) == ["Smaller", "Smaller", "Smaller", 10, 20, 40, 76]
