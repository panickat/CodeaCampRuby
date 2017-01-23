=begin
def char
  chars = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K"]
  char_by_char = []
  chars.each do |char|
     char_by_char << char
  end
  char_by_char.join(", ")
end

#test
p char == "A, B, C, D, E, F, G, H, I, J, K"
=end
def char; ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K"].join(", ") end; p char == "A, B, C, D, E, F, G, H, I, J, K"