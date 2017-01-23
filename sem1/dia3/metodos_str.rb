=begin
#[]
frutas = ["fresa", "durazno"]
p frutas[0]
#=>"fresa"

#[]=
frutas = ["fresa", "durazno"]
frutas[1] = "mango"
p frutas
#=>["fresa", "mango"]

#capitalize
x = "welcome"
p x.capitalize
#=>"Welcome"

#chr
word = "programación"
p word.chr
#=>"p"

#count
saludo = "Hola"
p saludo.count("l")
#=>1

#empty?
nada = ""
p nada.empty?
#=>true

#sub
p "hello".sub(/e/, '*')
#=>"h*llo"

#gsub
p "hello".gsub(/[e,o,l]/, '*')
#=>"h****"

#include?
lugar = "Mexico"
p lugar.include? "x"
#=>true

#index
numeros = [1, 0, 23, 45]
p numeros.index(23)
#=>2

#reverse
saludo = "Hola"
p saludo.reverse
#=>"aloH"

#split
saludo = "Hola como estas?"
p saludo.split
#=>["Hola", "como", "estas?"]

#strip
invitacion = " Vamos a Mexico "
p invitacion.strip
#=>"Vamos a Mexico"

#length
invitacion = "Vamos a Mexico"
p invitacion.length
#=>14

#upcase
first_name = "Carlos"
p first_name.upcase
#=>"CARLOS"

#downcase
first_name = "Carlos"
p first_name.downcase
#=>"carlos"  
=end
payment="Welcome, your Visa Credit Card has been processed"
$success, $fail ="Credit Card has been Charged" , "We only accept visa credit card"  

def vercard(str)
  str.downcase.include?("visa") ? $success : $fail
end

p vercard(payment) == $success
p vercard("American Express") == $fail
p vercard("Visa/Master Card") == $success