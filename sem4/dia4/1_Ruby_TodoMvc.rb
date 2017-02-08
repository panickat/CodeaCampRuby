=begin
Ruby To Do's Mvc

Esta es la aplicación mas completa que habrás hecho hasta ahora. Utiliza todos los conocimientos que has aprendido. Woow cuántas cosas hemos visto !!

Iremos creciendo la aplicación en varias iteraciones siguiendo el algoritmo de divide y vencerás.

Esta aplicación tiene todos los elementos necesarios para ser diseñada utilizando el concepto de MVC.

An easy way to understand MVC: the model is the data, the view is the window on the screen, and the controller is the glue between the two.
Connelly Barnes
Intenta seguir este patrón arquitectónico para crear tu aplicación. Recuerda los principios de Single Responsability y Separation of Concerns mientras decides que clases y métodos crear. Observa como dependiendo de la estructura que eliges para tu programa las siguientes iteraciones pueden ser más fáciles o difíciles de incorporar.

Es importante revisar el IO open mode para el manejo de archivos en este ejercicio.

Construirás algo similar al siguiente mock-up (no te limites):

$ ruby todo.rb add Terminar el tutorial de jQuery
...
$ ruby todo.rb index
...
$ ruby todo.rb add
...
$ ruby todo.rb delete <task_id>
...
$ ruby todo.rb complete <task_id>
...
Objetivos Académicos
Repasar y aplicar todos los conceptos vistos anteriormente.
Practicar trabajo en equipo y división de tareas.
Desarrollar una aplicación completa, vivir la experiencia y sus desafíos.
Actividades
Paso 1: Responsabilidades vs Ruby code
Crea una tabla como la siguiente donde iguales las responsabilidades que tendrá tu programa contra código de Ruby.

Responsabilidad	Ruby code
Inicializar una lista vacía	list = List.new
Agregar una tarea a la lista	list.add(Task.new('Comprar chicles')
Parsear el archivo CSV e instancear clases de Ruby	???
Enumera todas las responsabilidades que se te ocurran. Y sepáralas de acuerdo a la parte del modelo MVC que la realizaría.

Aunque al principio tengas que escribir más código para tener tu aplicación separada en MVC, al largo tendrá muchos beneficios.

Paso 2: Crear un archivo para que persista la información
Crea un archivo CSV donde enlistes una serie de tareas. Una por cada línea.

Ejemplo:

Comprar manzanas rojas
Lavar la ropa
Convertirme en un Developer Rock Star
Paso 3: Implementar el comando index
Al recibir el comando index, deberás de leer el archivo CSV del paso anterior y mostrar en la consola las tareas enumeradas.

Ejemplo:

$ ruby todo.rb index
1. Comprar manzanas rojas
2. Lavar la ropa
3. Convertirme en un Developer Rock Star
Paso 4: Implementar el comando add
Un usuario puede agregar nuevas tareas desde la consola.

Ejemplo:

$ ruby todo.rb add Sacar a Fido a pasear
Agregaste la tarea: "Sacar a Fido a pasear" a tu lista.
Paso 5: Implementar el comando delete
Un usuario puede borrar tareas desde la consola especificando el número de la tarea. Este número es el que se muestra con el comando index.

$ ruby todo.rb index
1. Comprar manzanas rojas
2. Lavar la ropa
3. Convertirme en un Developer Rock Star

$ ruby todo.rb delete 2
Eliminaste la tarea: "Lavar la ropa" de tu lista.

1. Comprar manzanas rojas
2. Convertirme en un Developer Rock Star
Paso 6: Implementar el comando complete
Sería bueno que nuestro programa pudiera recordar las tareas que ya completamos sin tener que borrarlas.

Ejemplo:

$ ruby todo.rb index
1. [ ] Comprar manzanas rojas
2. [ ] Lavar la ropa
3. [ ] Convertirme en un Developer Rock Star

$ ruby todo.rb complete 2
Completaste la tarea: "Lavar la ropa".

1. [ ] Comprar manzanas rojas
2. [X] Lavar la ropa
3. [ ] Convertirme en un Developer Rock Star
Paso 7: Extras
Diviértete y añade funcionalidades a tu programa para ver si Google te lo compra.
=end
=begin
Modelo:
Indice, tarea, tarea_pendiente?
Vista:
initialize: show_task
Todas las tareas: show_all
Tareas pendientes: show task
Tareas terminadas: show done
Nueva Tarea: add index
Borrar tarea: done index
Salir: exit
Controlador:
Crear modelo en CSV
Crear metodo writer
Crear metodo reader
=end
class Model
  attr_writer :file
  require "CSV"

  def initialize(file: "data.csv")
    @file = file
  end
  def write(arrto_write)
    # modes: http://stackoverflow.com/questions/3682359/what-are-the-ruby-file-open-modes-and-options
    CSV.open(@file, "wb") do |csv|
      arrto_write.each do |row|
        csv << row
      end
    end
  end
  def read
    if File.file?(@file)
      CSV.read(@file)
    else
      puts "Nice not task today ..."
      File.new(@file, "w")
      CSV.read(@file)
    end
  end

end
class Controller
  def initialize(file="data.csv")
    @model = Model.new
    @file = file
    show
    cmds_loop
  end
  def cmds_loop
    prompt = "show task|done, task, done, delete, exit: cmds to use :> "
    cmd = ""
    until cmd == "exit"
      print prompt
      cmd = case_cmds(STDIN.gets.chomp)
    end
    puts "bye! ;)"
  end
  def case_cmds(cmd)
    if cmd == "show"
      show
    elsif cmd.include?("show task") == false && cmd.include?("task ") == true
      task(cmd[5..cmd.length - 1])
    elsif cmd.include?("show done") == false && cmd.include?("done ") == true
      done(cmd[5..cmd.length - 1])
    elsif cmd.include?("show done") == true
      show_done
    elsif cmd.include?("show task") == true
      show_task
    elsif cmd.include?("delete ") == true
      delete(cmd[7..cmd.length - 1])
    elsif cmd == "exit"
      cmd
    else
      puts "this is not a correct command =P"
    end

  end

  def show
      list = @model.read
      if list.empty?
        puts "Nice not task today ..."
      else
        puts "List To do:"
        print_todo(list)
      end
  end
  def task(cmd)
    history_list = @model.read
    last_row = history_list.last

    if last_row.nil?
      history_list << [1, cmd, "pending :("]
    else
      history_list << [last_row[0].to_i + 1, cmd, "pending :("]
    end
    @model.write(history_list)
    show
  end
  def done(cmd)
    history_list = @model.read
    history_list[cmd.to_i - 1][2] = "done :)"
    @model.write(history_list)
    show
  end
  def show_done
    puts "Good work all this task are done .. =D"
    print_todo(@model.read.select {|row| row[2].include?("done")})
  end
  def show_task
    puts "Cheer up! all this task are pending .. =/"
    print_todo(@model.read.select {|row| row[2].include?("pending")})
  end
  def delete(cmd)
    puts "task #{cmd} was deleted =O"
    reject = @model.read.reject {|row| row[0].to_i == cmd.to_i}
    @model.write(reject)
    show
  end
  def print_todo(list)
    list.each_with_index {|row,i| puts "#{row[0]}).- #{row[1]} #{row[2]}"}
  end

end

todo = Controller.new
