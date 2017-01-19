=begin
Painting A Door

Crea el método spray_paint que pueda ser llamado sobre una instancia y modifique el color de la puerta. Haz pasar la prueba.

#test
p big_door.spray_paint('yellow') == "The Yellow door looks great!"
=end
class Painting_ador
  def spray_paint(color = "no_color")
    "The #{color.capitalize} door looks great!"
  end
end

big_door = Painting_ador.new
#test
p big_door.spray_paint('yellow') == "The Yellow door looks great!"
