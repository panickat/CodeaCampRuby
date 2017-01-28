require "colorize"
def tablero_gato(n)

  linea = [[""] * 3]
  tablero = [linea * 3]
  tableros = tablero * n

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

  for l in 0..tableros[0].length - 1
    for c in 0..tableros[0][l].length - 1
      i += 1

      if color == true
        nombre_pieza += "  "
        for t in 0..tableros.length - 1
          tableros[t][l][i - 1] = jugadas_gato
          nombre_pieza += cuadro(tableros[0][l][i - 1],player_color,:cyan)
        end
        color = false
      else
        nombre_pieza += "  "
        for t in 0..tableros.length - 1
          tableros[t][l][i - 1] = jugadas_gato
          nombre_pieza += cuadro(tableros[0][l][i - 1],player_color,:white)
        end
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

    end
  end
  tableros
end
def cuadro(str,player_color,background)
   str.ljust(3).colorize(player_color).colorize( :background => background)
end

def jugadas_gato
  jugada = ["X","O"]
  jugada[rand(0..1)]
end

p tablero_gato(3)
