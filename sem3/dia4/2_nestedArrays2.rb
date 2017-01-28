
def tablero_gato(n)
  require "colorize"
=begin
  Error: Duda Generar exactamente el mismo array de esta forma altera la impresion
  linea = ["x"] * 3
  tablero = [[linea] * 3]
  tableros = tablero * n
=end
  tableros = []
  for i in 1..n
    tableros << [['a','b','c'],['d','e','f'],['g','h','i']]
  end
  p "Cada gato es una tabla con este formato: "
  p tableros[0]
  player_change_color = true
  color = true
  player_color = :black
  background = :cyan

  for t in 0..n - 1
    for l in 0..tableros[t].length - 1
      i = 0
      for c in 0..tableros[t][l].length - 1
        i += 1

        if color == true
          background = :cyan
          color = false
        else
          background = :white
          color = true
        end

        if player_change_color == true
          player_color = :red
          player_change_color = false
        else
          player_color = :black
          player_change_color = true
        end
        tableros[t][l][c] = cuadro(jugadas_gato,player_color,background)

        if i == 3
          i = 0
          if color == true
            color = true
          else
            color = false
          end
        end

      end
    end
  end
  cuadro = [""] * n

  for l in 0..tableros[0].length - 1
    for c in 0..tableros[0][l].length - 1

      for t in 0..cuadro.length - 1
        cuadro[t] += tableros[t][l][c]
      end
      i += 1

      if i == 3
        puts cuadro.inject {|m,sum| m + "  " + sum}
        cuadro = [""] * n
        p
        i = 0
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

t = tablero_gato(5)
p t[4] == t[1]
p t[0] == t[1]
p t[0] == t[2]
p t[0] == t[3]
p t[0] == t[4]
