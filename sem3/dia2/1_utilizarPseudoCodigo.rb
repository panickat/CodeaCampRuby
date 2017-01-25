=begin
Utilizar Pseudocódigo

En la vida existen muchos lenguajes pero al final siempre acabamos hablando una mezcla de varios de ellos por facilidad o practicidad.

Todos los lenguajes son una especie de código, te recomiendo leer este libro donde aprenderás la importancia del código y además como funciona una computadora o como es que llegamos a crearlas.

Code: The Hidden Language of Computer Hardware and Software
Como ejemplo, es muy común que los programadores mexicanos hablen en Spanglish o pocho, ya que muchos términos de la tecnología se escuchan mejor en ingles. O simplemente inventan nuevas palabras como vamos a codear.

En este momento estas aprendiendo el lenguaje de las computadoras; aunque en tu vida cotidiana hablas tu propio lenguaje y con el, te comunicas con las demás personas.Tu no piensas en código, o cuando lo lees no lo lees literalmente. Si no que en realidad usas un lenguaje intermedio entre español y código. Este lenguaje intermedio se le llama pseudocódigo.

Como programador es muy importante poder comunicar a otros la funcionalidad de tu programa o su estructura misma. Además entre mejor te comunicas en pseudocódigo, mejor conocerás como realmente piensan las computadoras. Lo primero que hace un buen programador es imaginarse como resolver un problema, luego lo escribe en pseudocódigo y en base a ese pseudocódigo escribe el código de su programa.

Objetivos Académicos
Aprender a escribir Pseudocódigo
Aprender a leer código e interpretarlo
Actividades
Para escribir pseudocódigo tienes que simplemente ser práctico. Cuando te conviene hablar en ingles y cuando en código.

Deberás traducir el siguiente código a pseudocódigo utiliza los siguientes enlaces para mejorar tus resultados.

External Resources
Psuedocode by Naomi Nishimura from Cornell
Pseudocode Standard from CalPoly
Primero preguntate que hace el programa. Lee cuidadosamente cada linea y despues escribe el pseudocódigo.

students = [[["Eliezer", 7], ["Mariam", 7], ["Deborah", 10], ["Harley", 7]],
 [["D'angelo", 10], ["Brittany", 8], ["Hubert", 7], ["Erling", 9]],
 [["Bradford", 7], ["Theodora", 10], ["Casandra", 9], ["Lindsay", 8]],
 [["Hilma", 10], ["Lina", 10], ["Isabell", 8], ["Urban", 9]]]

def best_students(students)
  best_students = []
  x, y        = 0, 0

   while y < students.length
    current_student  = students[y][x]

    if current_student[1] == 10
      best_students.push(current_student[0])
    end

    if x == (students[y].length - 1)
      x = 0
      y += 1
    else
      x += 1
    end
  end
  best_students
end

p best_students(students) == ["Deborah","D'angelo","Theodora","Hilma","Lina"]
=end
# Table students 4 row 4 col
students =
 [[["Eliezer", 7], ["Mariam", 7], ["Deborah", 10], ["Harley", 7]],
 [["D'angelo", 10], ["Brittany", 8], ["Hubert", 7], ["Erling", 9]],
 [["Bradford", 7], ["Theodora", 10], ["Casandra", 9], ["Lindsay", 8]],
 [["Hilma", 10], ["Lina", 10], ["Isabell", 8], ["Urban", 9]]]
# Method recive table
def best_students(students)
  # Init Array best_students
  best_students = []
  # init navigation table: row colum
  x, y        = 0, 0
  # While row less than table rows
  while y < students.length
    # Current row allocate in student
    current_student  = students[y][x]
    # If got best studen. Collect
    if current_student[1] == 10
      best_students.push(current_student[0])
    end
    # If read all cols in row
    if x == (students[y].length - 1)
      x = 0
      y += 1
    else
      # move to next row
      x += 1
    end
  end
  best_students
end
#check Method return only studensts with 10 note
p best_students(students) == ["Deborah","D'angelo","Theodora","Hilma","Lina"]

# Init Table students 4 row 4 col
# Method recive table

  # Init Array best_students
  # init navigation table: row colum

  # While row less than table rows
    # Current row allocate in student
    # If got best studen. Collect
    # If read all cols in row
      # move to next row
    # end if
# return
#check Method return only studensts with 10 note
