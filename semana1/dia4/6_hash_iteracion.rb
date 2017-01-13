def family_members(h)
  respuesta = []

  h.each do |k,v|
    respuesta.concat(v) if (k == :sisters || k == :brothers)
  end
  respuesta
end

family = {  uncles: ["jorge", "samuel", "steve"],
            sisters: ["angelica", "mago", "julia"],
            brothers: ["polo","rob","david"],
            aunts: ["maria","minerva","susana"]
          }

#test
p family_members(family) == ["angelica", "mago", "julia", "polo", "rob", "david"]