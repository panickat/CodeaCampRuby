def print_val(h)
  r = []
  h.map do |k,v|
    r.push(k)
  end
  r
end

h={key1:"val1", key2:"val2", key3:"val3"}
p print_val(h) == [:key1, :key2, :key3]