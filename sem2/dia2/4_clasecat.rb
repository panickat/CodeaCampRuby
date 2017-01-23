=begin
Crea una clase Cat que permita crear objetos Cat con diferentes nombres y que le permita al gato realizar las siguientes acciones: 
meow, run y jump Haz pasar la pruebas correspondientes.
=end
class Cat

	@@corriendo = 0

	def initialize(name="not_usrcat")
		@name = name	
	end

	def self.meow
		"Miau... Miau..."
	end
	
	def run(n=0)
		@@corriendo += n
		"Corriendo #{@@corriendo} mts..."
	end
	
	def jump
		"Saltando..."		
	end

	def catname
		@name

	end

end

cat_1 = Cat.new
cat_5 = Cat.new

#test

cat_3 = Cat.new("catty")

p cat_1.jump == "Saltando..."
p cat_5.jump == "Saltando..."
p Cat.meow == "Miau... Miau..."
p cat_3.run == "Corriendo 0 mts..."
p cat_3.run(20) == "Corriendo 20 mts..."
p cat_3.run(10) == "Corriendo 30 mts..."
p cat_3.run(10) == "Corriendo 40 mts..."