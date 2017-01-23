def explicito(str)
  return str + " "
end

def inplicito(str)
str
end

puts explicito("hola") + inplicito("mundo") 