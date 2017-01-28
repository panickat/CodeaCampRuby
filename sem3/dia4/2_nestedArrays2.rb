require "colorize"
def tablero_gato(n)

  linea = [["x"] * 3]
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
continuo = 0
background = :cyan
#t2 = [[[1,2,3],[4,5,6],[7,8,9]]]
t2 = []
t2 << [["a","b","c"],["d","e","f"],["g","h","i"]]
t2 << [["a","b","c"],["d","e","f"],["g","h","i"]]

for t in 0..tableros.length - 1
  continuo = 0
  for l in 0..tableros[t].length - 1
    for c in 0..tableros[t][l].length - 1
      i += 1
      continuo += 1

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
      t2[t][l][c] = cuadro(jugadas_gato,player_color,background)

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

p t2[0] == t2[1]
  i = 0
  l = ""
#cuadro = ""
#cuadro2 = ""
cuadro = ["",""]
out = ""
#for t in 0..tableros.length - 1
  for l in 0..tableros[0].length - 1
    for c in 0..tableros[0][l].length - 1

      #cuadro += t2[0][l][c]
      #cuadro2 += t2[1][l][c]
      for t in 0..t2.length - 1
        cuadro[t] += t2[t][l][c]
      end

      i += 1
      if i == 3
        #puts cuadro + " " + cuadro2
        #cuadro = ""
        #cuadro2 = ""
        #for t in 0..cuadro.length - 1

        #end
        puts cuadro[0] + " " + cuadro[1]
        cuadro = ["",""]
        p
        i = 0
      end

    end
  end

#end

end

def cuadro(str,player_color,background)
   str.ljust(3).colorize(player_color).colorize( :background => background)
end

def jugadas_gato
  jugada = ["X","O"]
  jugada[rand(0..1)]
end

tablero_gato(2)
