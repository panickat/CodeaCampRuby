=begin
Nested Arrays 2

En este ejercicio vamos a llevar la creación de arrays y también hashes a un nivel más elevado.

Intenta comprender el siguiente método y dime si puedes, antes de correrlo saber que regresará. Te servirá descomponerlo por partes para poder analizarlo y jugar con los argumentos en cada segmento.

abecedario = ('A'..'Z').last(20)
p que_sera = Array.new(3) { abecedario.pop(2) }
Objetivos Académicos
Generar arrays y hashes dinamicamente
Utilizar bloques y los métodos nativos de ruby para agilizar la generación de código
Combinar ciclos, condiciones para hacer dinámico el acceso a arrays y hashes
Actividades
Daremos un nuevo paso en nuestro juego de Gato. Ya teniendo el tablero y sabiendo crearlo ahora queremos crear un método que cree tableros, pero que cada vez estos sean diferentes.

Existen muchas maneras para crear este método
Crea dos implementaciones diferentes
Intenta que la segunda sea compacta, elegante y COMPRENSIBLE.
Seguramente tus métodos estan bien pero no son muy realistas, crea un método que contenga el numeró real de "X" y "O". Cinco y cuatro dependiendo con cual empieces y piensa también en como crear una prueba que garantice que esto suceda.

Convertir nested arrays en hashes
Intenta convertir la tabla del ejercicio pasado en un array donde cada persona sea un hash. Para ayudarte existe un método que facilita este proceso pero requiere que tu array de arrays este en cierto formato.

Hash Docs

Ejemplo:

[{"Nombre"=>"Rodrigo García", "Edad"=>13, "Genero"=>"Masculino", "Grupo"=>"Primero", "Calificaciones"=>[9, 9, 7, 6, 8]},...
Crea cinco pruebas donde verifiques que puedes acceder a la información y que es correcta.
=end
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
