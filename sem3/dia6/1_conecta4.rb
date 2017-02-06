=begin
Conecta Cuatro

Vamos a crear un programa que seguramente será el más divertido hasta ahora. Alguna vez has jugado Conecta Cuatro?

Conecta Cuatro es un juego de mesa para dos jugadores en el cual se introducen fichas en un tablero vertical con el objetivo de alinear cuatro fichas consecutivas de un mismo color.

El tablero esta formado por 6 filas y 7 columnas. Cada jugador dispone de 21 fichas de un color.2 Por turnos, los jugadores deben introducir una ficha en la columna que prefieran (siempre que no esté completa) y ésta caerá a la posición más baja.

Gana la partida el primero que consiga alinear cuatro fichas consecutivas de un mismo color en horizontal, vertical o diagonal.

alt text

Objetivos Académicos
Distribución de responsabilidades
Implementar mejores interfaces
Modelar un juego de la vida real
Actividades
La primera implementación de tu programa será totalmente automatizada, esto quiere decir que de manera aleatoria el programa eligirá donde tira cada participante su ficha.

Piensa como representaras el color de las fichas o las fichas mismas para que sean diferenciadas tanto interna como externamente.

La parte más complicada de este ejercicio es revisar después de que cada participante tira una ficha si existe la conexión de cuatro fichas vertical, horizontal o diagonalmente. Lo bueno es que ya realizaste algo similar y mas complicado en el reto de la Sopa de Letras.

Estos son algunos de los métodos que deberá tener tu clase ConectFour:

print_board # imprime y actualiza la representación del tablero.
drop_chip!(player) # determina una columna y tira la ficha de un jugador especifico.
finished? # regresa true si un jugador conecta cuatro o si se acabo el tablero, false de otra manera.
winner # regresa el nombre de la persona que gano el juego.
Print Board
Deberás implementar como primer paso la función de print_board.

Tiro de ficha y Representación dinámica
Como segundo paso deberás modelar el turno de cada participante drop_chip!.

Tu programa deberá modelar como es que van cayendo las fichas. Utiliza estos métodos para mejorar la interfaz de tu programa, juega con ellos para entender como funcionan:

# Duerme la ejecución del programa, para retrasar un proceso.
sleep()

# Clear the screen
def clear_screen!
  print "\e[2J"
end

# Moves cursor to the top left of the terminal
def move_to_home!
  print "\e[H"
end

# Use "reputs" to print over a previously printed line,
# assuming the cursor is positioned appropriately.
def reputs(str = '')
  puts "\e[0K" + str
end
Finished?
Por último deberás de crear el método que revisará después de cada turno si es que existe un ganador, esto es si hay cuatro fichas juntas en cualquier dirección.

Extra
Ahora dale vida a tu juego y deja que dos usuarios puedan elegir las columnas y realmente jugar!!!
=end
# Pendiente de hacer
