def tablero_gato(n)
  require "colorize"
  tableros = []

  for i in 1..n
    tableros << [['a','b','c'],['d','e','f'],['g','h','i']]
  end
  p "Cada gato es una tabla con este formato: "
  p tableros[0]

  for t in 0..n - 1
    i = 0
    cuadro = [""] * n
    for l in 0..tableros[t].length - 1
      for c in 0..tableros[t][l].length - 1
        i += 1

        _background = background(_background)
        _player_color = player_color(_player_color)

        tableros[t][l][c] = formato(jugadas_gato,_player_color,_background)

        for t2 in 0..cuadro.length - 1
          cuadro[t2] += tableros[t2][l][c]
        end

        if i == 3
          puts cuadro.inject {|m,sum| m + "  " + sum} if t == n -1
          cuadro = [""] * n
          i = 0
        end

      end
    end

  end
  tableros
end

def background(background)
  background == :cyan ? :white : :cyan
end
def player_color(_player_color)
  _player_color == :black ? :red : :black
end

def formato(str,player_color,background)
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
