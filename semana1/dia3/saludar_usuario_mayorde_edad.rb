def verificar_usr(name, age)
  if (name == "cris") and (age >= 18)
    return "Welcome"
  else
    return "No eres Mayor de Edad"
  end
end

p verificar_usr("cris", 18) == "Welcome"
p verificar_usr("jon", 18) == "No eres Mayor de Edad"
p verificar_usr("cris", 17) == "No eres Mayor de Edad"
