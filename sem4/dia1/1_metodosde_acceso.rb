=begin
Métodos De Acceso

Ruby tiene un principio que esperamos ya conozcas llamado DRY que busca que no repitas código que ya escribiste. Por ello se crearon los accessor methods para simplificar tu código.

Las clases tienen que comunicarse a través de métodos con el exterior. Cada variable puede tener una manera de ser leída y/o una de ser escrita, o ninguna.

Why use Ruby's attr_accessor, attr_reader and attr_writer?
Existen dos tipos básicos de accessor methods (Reader y Writer):

class Table
    # Reader

    def size
        size
    end

    def color
        color
    end

    def material
        material
    end

    # Writer

    def size=(new_size)
        size = new_size
    end

    def color=(new_color)
        color = new_color
    end
end
Por cada variable que quieras que sea leída y/o escrita necesitaras estos métodos pero existe una mejor forma de declararlos.

Ruby tiene una manera corta de declarar estos métodos.

class Table
    # Reader
    attr_reader :size, :color, :material

    # Writer
    attr_writer :size, :color
end
O en el caso de tener los dos..

class Table
    # Reader y Writer
    attr_accessor :size, :color

    # Reader
    attr_reader :material
end
Objetivos Académicos
Conocer los métodos de acceso a una clase
Declarar estos métodos de manera simplificada
Actividades
Dentro del código veras dos clases, simplifica estas clases siguiendo el método corto que ofrece Ruby, piensa bien cuales puedes remplazar por attr_reader, attr_writer, o attr_accessor y hazlo.

No deberás de modificar el Driver Code

class Course

  def initialize(name)
    @course_name  = name
    @students   = []
  end

  def course_name
    @course_name
  end

  def course_name=(new_name)
    @course_name = new_name
  end

  def add_student(student)
    @students << student
  end

  def students
    @students
  end
end


class Student

  @@id = 0

  def initialize(name, last_name, campus)
    @name     = name
    @last_name = last_name
    @campus = campus
    @id       = new_id
  end

  def new_id
    @@id += 1
  end

  def name
    @name
  end

  def name=(new_name)
    @name = new_name
  end

  def last_name
    @last_name
  end

  def last_name=(new_last_name)
    @last_name = new_last_name
  end

  def campus
    @campus
  end

  def campus=(new_campus)
    @campus = new_campus
  end

  def id
    @id
  end

end


# NO MODIFICAR

# Driver Code ==============================================


math = Course.new("Math")

fernando = Student.new("Fernando","Romero", "Guadalajara")

math.add_student(fernando)

puts ("#{math.course_name} - #{math.students.first.name} #{math.students.first.last_name}: #{math.students.first.campus}") == "Math - Fernando Romero: Guadalajara"
puts math.respond_to?(:students=) == false
puts math.respond_to?(:students) == true
puts math.respond_to?(:add_student) == true
puts math.respond_to?(:course_name=) == true

fernando.name = "Not Rodrigo"
fernando.last_name = "GRRR"
fernando.campus = "Monterrey"

math.course_name = "Mathematics"

puts ("#{math.course_name} - #{math.students.first.name} #{math.students.first.last_name}: #{math.students.first.campus}") == "Mathematics - Not Rodrigo GRRR: Monterrey"
puts fernando.respond_to?(:id=) == false
puts fernando.respond_to?(:id) == true
puts fernando.respond_to?(:name) == true
puts fernando.respond_to?(:last_name=) == true
=end
class Course
  attr_reader :students
  attr_accessor :course_name

  def initialize(name)
    @course_name  = name
    @students   = []
  end

  def add_student(student)
    @students << student
  end

end

class Student
  attr_accessor :name, :last_name, :campus
  attr_reader :id
  @@id = 0

  def initialize(name="", last_name="", campus="")
    @name     = name
    @last_name = last_name
    @campus = campus
    @id       = new_id
  end

  def new_id
    @@id += 1
  end
end


# NO MODIFICAR

# Driver Code ==============================================


math = Course.new("Math")

fernando = Student.new("Fernando","Romero", "Guadalajara")

math.add_student(fernando)

puts ("#{math.course_name} - #{math.students.first.name} #{math.students.first.last_name}: #{math.students.first.campus}") == "Math - Fernando Romero: Guadalajara"
puts math.respond_to?(:students=) == false
puts math.respond_to?(:students) == true
puts math.respond_to?(:add_student) == true
puts math.respond_to?(:course_name=) == true

fernando.name = "Not Rodrigo"
fernando.last_name = "GRRR"
fernando.campus = "Monterrey"

math.course_name = "Mathematics"

puts ("#{math.course_name} - #{math.students.first.name} #{math.students.first.last_name}: #{math.students.first.campus}") == "Mathematics - Not Rodrigo GRRR: Monterrey"
puts fernando.respond_to?(:id=) == false
puts fernando.respond_to?(:id) == true
puts fernando.respond_to?(:name) == true
puts fernando.respond_to?(:last_name=) == true
