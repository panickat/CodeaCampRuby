class NumberGuessingGame

	@@unknown = 0
	

	def initialize
		@@unknown = rand(0..9)		
	end

	def guess

		prompt = "escribe tu numero > "
		trys = 0
		puts "Hola! en cuantos intentos crees poder adivinar un numero entre 0 y 9"
		print prompt

	begin 
		while user_input = Integer(gets.chomp) 

			trys += 1	
			case user_input
			 when 0..9
				if user_input == @@unknown 

					puts "Genial! adivinasate el numero en #{trys} intentos"
					break
				elsif user_input > @@unknown
					puts "Muy alto"
				elsif user_input < @@unknown
					puts "Muy bajo"
				end
			  else
			    puts "Perdona! solo escribe numeros entre 0 y 9"
			    print prompt
			end
		end
	rescue 
		puts "Perdona! solo escribe numeros entre 0 y 9"
		print prompt
		retry
	end

	end
end



game = NumberGuessingGame.new
game.guess