=begin
Gallinita Ponedora

Vamos a crear un programa que modele a un granjero que recoge huevos de gallinas ponedoras. Este será un sistema que contendrá dos tipos de objetos: Huevo(Egg) y Gallina Ponedora(LayingHen).

Objetivos Académicos
Practicar el concepto de scope
Practicar el uso de attr_reader/writer/accessor methods
Recursos Externos
Video: Variable Scopes in Ruby
StackOverflow: What is attr_accessor in Ruby?
StackOverflow: Why use Ruby's attr_accessor, attr_reader, and attr_writer?
Actividades
Abajo encontraras una estructura de código y comentarios que deberás seguir para crear este programa. Adicionalmente encontraras driver code, que deberás usar como una guía para que funcione tu programa.

class LayingHen

  def initialize
  end

  # Ages the hen one month, and lays 4 eggs if the hen is older than 3 months
  def age!
  end

  # Returns +true+ if the hen has laid any eggs, +false+ otherwise
  def any_eggs?
  end

  # Returns an Egg if there are any
  # Raises a NoEggsError otherwise
  def pick_an_egg!
    raise NoEggsError, "The hen has not layed any eggs" unless self.any_eggs?

    # egg-picking logic goes here
  end

  # Returns +true+ if the hen can't laid eggs anymore because of its age, +false+ otherwise.
  # The max age for a hen to lay eggs is 10
  def old?
  end

  def increase_hatched_hour(hours)
  end
end

class Egg
  # Initializes a new Egg with hatched hours +hatched_hours+
  def initialize
  end

  # Return +true+ if hatched hours is greater than 3, +false+ otherwise
  def rotten?
  end
end


hen = LayingHen.new
basket = []
rotten_eggs = 0

hen.age! until hen.any_eggs?

puts "Hen is #{hen.age} months old, its starting to laid eggs."
puts ""

until hen.old?

  # The time we take to pick up the eggs
  hours = rand(5)
  hen.increase_hatched_hour(hours)

  while hen.any_eggs?
    egg = hen.pick_an_egg!

    if egg.rotten?
      rotten_eggs += 1
    else
      basket << egg
    end
  end

  puts "Month #{hen.age} Report"
  puts "We took #{hours} hour(s) to pick the eggs"
  puts "Eggs in the basket: #{basket.size}"
  puts "Rotten eggs: #{rotten_eggs}"
  puts ""

  # Age the hen another month
  hen.age!
end

puts "The hen is old, she can't laid more eggs!"
puts "The hen laid #{basket.size + rotten_eggs} eggs"
if rotten_eggs == 0
  puts "CONGRATULATIONS NO ROTTEN EGGS"
else
  puts "We pick to late #{rotten_eggs} eggs so they become rotten"
end
=end

class LayingHen
  attr_reader :age
  def initialize
    @age = 0
    @egg = []
  end

  # Ages the hen one month, and lays 4 eggs if the hen is older than 3 months
  def age!
    4.times {@egg << Egg.new( @hatched_hour )}  if @age > 1
    @age += 1
    #p "age! #{@age} eggs -> #{@egg.length}"
    @age
  end

  # Returns +true+ if the hen has laid any eggs, +false+ otherwise
  def any_eggs?
    #p "any_eggs? hen_age #{@age}  eggs ->  #{@egg.length}  #{@egg}"
    @egg.length > 0 ? true : false
  end

  # Returns an Egg if there are any
  # Raises a NoEggsError otherwise
  def pick_an_egg!
    #p "pick egg #{r} -> @eggs#{@egg}"
    #p "antes rise r : #{r}"
    raise NoEggsError, "The hen has not layed any eggs" unless self.any_eggs?
    #todo bien se salta el rescue, error lee el rescue
    @egg.collect {|egg| egg.hatched = @hatched_hour }
    @egg.pop
  rescue
    # egg-picking logic goes here
    #p "despues rise r: #{r}"
    false
  end

  # Returns +true+ if the hen can't laid eggs anymore because of its age, +false+ otherwise.
  # The max age for a hen to lay eggs is 10
  def old?
    @age == 10 ? true : false
  end

  def increase_hatched_hour(hours)
    @hatched_hour = hours
  end
end

class Egg
  attr_writer :hatched
  # Initializes a new Egg with hatched hours +hatched_hours+
  def initialize(hours)
    @hatched = hours
  end

  # Return +true+ if hatched hours is greater than 3, +false+ otherwise
  def rotten?
    @hatched > 3 ? true : false
  end
end

hen = LayingHen.new
basket = []
rotten_eggs = 0

hen.age! until hen.any_eggs?

puts "Hen is #{hen.age} months old, its starting to laid eggs. \n"
 #p "until old #{hen.age}"
until hen.old?

  # The time we take to pick up the eggs

  #p "hatched in until "
  hours = rand(5)
  hen.increase_hatched_hour(hours)

  while hen.any_eggs?

    #p "while"

    egg =  hen.pick_an_egg!
    #p "egg piked arriba"
     break unless egg

    if egg.rotten?
      #p "roten #{egg}"
      rotten_eggs += 1
    else
      #p "basket #{egg}"
      basket << egg
    end# if
  end# while

  puts "Month #{hen.age} Report"
  puts "We took #{hours} hour(s) to pick the eggs"
  puts "Eggs in the basket: #{basket.size}"
  puts "Rotten eggs: #{rotten_eggs}"
  puts ""

  # Age the hen another month
  hen.age!
end # until old

puts "The hen is old, she can't laid more eggs!"
puts "The hen laid #{basket.size + rotten_eggs} eggs"
if rotten_eggs == 0
  puts "CONGRATULATIONS NO ROTTEN EGGS"
else
  puts "We pick to late #{rotten_eggs} eggs so they become rotten"
end
