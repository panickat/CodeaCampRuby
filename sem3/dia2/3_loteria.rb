=begin
Lotería

¿Sabes cómo funciona la lotería?

La lotería básicamente funciona al revolver una serie de números y escoger aleatoriamente algunos de ellos los cuales serán los ganadores. Lo que hace interesante este juego es el revolver los números dando azar al juego.

En este ejercicio tendrás que crear un método que revuelva una serie de datos. La clase Array de Ruby cuenta con un método llamado shuffle el cual desgraciadamente no puedes usar, tampoco puedes utilizar Array#sort. Tendrás que crear el algoritmo tu mismo utilizando loops.

Para más información sobre Algoritmos Aleatorios revisa el Knuth Shuffle Method

Objetivos Académicos
Iterar a través de colecciones de datos (Enumerables)
Utilizar métodos aleatorios como sample y rand
Actividades
Escribe un método llamado shuffle el cual tome como argumento un Array y regrese un Array con los mismos números pero aleatoriamente ordenados. Cada resultado debe de tener la misma probabilidad de suceder, esto es lo que lo hace realmente aleatorio, ya que nunca puedes predecir en que orden caerán los números.

def shuffle(array)
  # escribe el algoritmo que revuelva un array
end


# Driver code:
array = (1..15).to_a

# Esto no deberá arrojar una excepción
10.times do |variable|
    raise "No esta revolviendo bien" if shuffle(array) == shuffle(array)
end
p true
=end
def shuffle(array)
  # escribe el algoritmo que revuelva un array
  a2 = []
  until array.length == 0
    s = array.sample
    a2 << s
    array = array.reject {|r| r == s}
  end
  a2
end


# Driver code:
array = (1..15).to_a

# Esto no deberá arrojar una excepción
10.times do |variable|
    raise "No esta revolviendo bien" if shuffle(array) == shuffle(array)
end
p true
