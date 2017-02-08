=begin
Juntando Fuerzas, Ruby Y Sql

Ya que los programadores solemos ser muy flojos, en este ejercicio vamos a crear métodos que nos ayuden a dejar de escribir SQL, para solamente escribir Ruby.

Vamos a usar la tabla de chefs del ejercicio de Recetas de Comida para empezar a crear nuestra base de datos desde Ruby.

Objetivos Académicos
Crear e interactuar con una base de datos desde código de Ruby
Usar la base de datos SQLite y la gema sqlite3
Actividades
Paso 1: Instalar la gema SQLite
$ gem install sqlite3
Paso 2: Setup
Para iniciar necesitamos 2 funciones:

create_table que creará la tabla chefs
seedque insertará registros de ejemplo en la tabla
Completa el código de seed para insertar más registros de ejemplo.

require 'sqlite3'

class Chef
  def self.create_table
    Chef.db.execute(
      <<-SQL
        CREATE TABLE chefs (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          first_name VARCHAR(64) NOT NULL,
          last_name VARCHAR(64) NOT NULL,
          birthday DATE NOT NULL,
          email VARCHAR(64) NOT NULL,
          phone VARCHAR(64) NOT NULL,
          created_at DATETIME NOT NULL,
          updated_at DATETIME NOT NULL
        );
      SQL
    )
  end

  def self.seed
    Chef.db.execute(
      <<-SQL
        INSERT INTO chefs
          (first_name, last_name, birthday, email, phone, created_at, updated_at)
        VALUES
          ('Ferran', 'Adriá', '1985-02-09', 'ferran.adria@elbulli.com', '42381093238', DATETIME('now'), DATETIME('now'));
        -- Añade aquí más registros
      SQL
    )
  end


  private

  def self.db
    @@db ||= SQLite3::Database.new("chefs.db")
  end

end
Podemos usar irb para ejecutar las funciones que acabamos de crear:

$ irb
irb> load 'chef.rb'
=> true
irb> Chef.create_table
=> []
irb> Chef.seed
=> []
Verifica desde la consola de Sqlite que se halla creado la tabla y que se halla poblado con los registros que creaste en la función seed. Nuestra base de datos se llama chefs.db.

Paso 3: ORM
Crea una función para inicializar (initialize) un Chef con todos sus atributos.

Vamos a crear funciones para ejecutar la mayoría de los comandos que usamos en SQL, desde Ruby.

Fíjate la correspondencia que existe entre SQL y las funciones que vas a crear:

SQL-land	Ruby-land
La tabla de chefs	La clase Chef
Un registro de la tabla de chefs	Una instancia de la clase Chef
SELECT * FROM chefs	Chef.all
SELECT * FROM chefs WHERE first_name = 'fer'
OR
SELECT * FROM chefs WHERE first_name = ?, 'fer'	Chef.where('first_name', 'fer')
SELECT * FROM chefs WHERE id = 10
OR
SELECT * FROM chefs WHERE id = ?, 10	Chef.where('id', 10)
INSERT INTO chefs (field1, field2, ...) VALUES(value1, value2, ...)	chef = Chef.new(data) chef.save
DELETE FROM chefs WHERE id = 40	???
NOTA: Fíjate en la segunda forma de pasar parámetros a la claúsula WHERE. El ? se llama placeholder y sirve para evitar ataques de SQL injection. Busca más información sobre SQL injection.
=end
