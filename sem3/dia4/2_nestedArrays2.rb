#linea = [["x"] * 3]
#tablero = [linea * 3]


def tablero_gato
  require "colorize"
  linea = [[""] * 3]
  tablero = [linea * 3]

  i = 0
  nombre_pieza = ""
  color = true
  player_color = :black
  player_change_color = true
=begin
t2 = tablero[0].collect do |c|
  c.collect do |c2|
     c2 = jugadas_gato
  end
end
p tablero
p t2
exit
=end
  tablero[0].collect! do |line|
    line.collect! do |cuadro|
      i += 1
      cuadro = jugadas_gato
      if color == true
        nombre_pieza += cuadro.to_s.ljust(8).colorize(player_color).colorize( :background => :cyan)
        color = false
      else
        nombre_pieza += cuadro.to_s.ljust(8).colorize(player_color).colorize( :background => :white)
        color = true
      end

      if player_change_color == true
        player_color = :red
        player_change_color = false
      else
        player_color = :black
        player_change_color = true
      end

      if i == 3
        puts nombre_pieza
        i = 0
        nombre_pieza = ""
        if color == true
          color = true
        else
          color = false
        end
      end
      cuadro
    end
  end
  tablero
end

def jugadas_gato
  jugada = ["X","O"]
  jugada[rand(0..1)]
end

juego1 = tablero_gato
puts " "
p juego2 = tablero_gato == juego1
p juego3 = tablero_gato == juego1 || juego2
