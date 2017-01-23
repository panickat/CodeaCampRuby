
def large(str)
 str.length > 20 ? str.upcase : str  
end

#test
p large("Hola vamos a la comida") == "HOLA VAMOS A LA COMIDA"
p large("Es hora de dormir") == "Es hora de dormir"