class Controller
  def initialize(args)
    @view = View.new(true)
    Nav.current = :home
    cmds_loop
  end

  def cmds_loop
    cmd = ""
    until cmd == "Salir"
      cmd = case_cmds
    end
    @view.end_program
  end

  def case_cmds
    @view.prompt
    option = STDIN.gets.chomp
    option = Integer(option) rescue @view.err_cmd

    send(Nav.current, option)
  end

  def reservaciones(option)
    case option
    when 1
      Nav.current = :encuentra_tu_vuelo
      @view.flights(Nav.print_fields)
    when 2
      Nav.current = :home
    end
  end

  def home(option)
    case option
    when 1
      Nav.current = :reservaciones
    when 2
      Nav.current = :admin_login
      if admin_exists?(Nav.print_fields)
        Nav.current = :admin_options
      else
        Nav.current = :home
        @view.admin_error_login
      end
    when 3
      "Salir"
    end
  end

  def admin_options(option)
    case option
    when 1
      Nav.current = :view_flights
    when 2
      Nav.current = :view_bookings
    when 3
      Nav.current = :new_flight
      new_flight
    when 4
      Nav.current = :home
    end
  end

  def new_flight
    flight = Nav.print_fields
    row = Flight.new(flight)
    row.save
    while row.valid? == false do
      errors = Nav.new_flight
      join_desc_err = {}

      errors[:fields].keep_if { |k,v| row.errors.keys.include?(k) }
      errors[:fields].each {|k,v| join_desc_err[k] = "#{v} - #{row.errors.messages[k].join(' ')}" }
      errors[:fields] = join_desc_err

      errors = @view.print_fields(errors)
      flight = flight.merge!(errors)

      row = Flight.new(flight)
      row.save
    end
    @view.save_ok
    Nav.current = Nav.current
  end

  def admin_exists?(login)
    u = User.where("email = ?", login[:email])
    pwd = Admin.where(user_id: u.first.id, pwd: login[:pwd]).exists? unless u.first.nil?
    if pwd.nil? || pwd == false
      false
    else
      true
    end
  end
end

class Nav
  def self.current
    @@current
  end
  def self.current=(menu)
    if [:home, :admin_options, :reservaciones].include?(menu)
      system 'clear'
      @@current = menu
    end
    options_fields(send(menu))
  end
  def self.options_fields(menu)
    if menu.class.to_s == "Hash"
      View.new.print_options(menu) if menu.keys.last == :options
      @@print_fields = View.new.print_fields(menu) if menu.keys.last == :fields
    end
  end
  def self.print_fields
    @@print_fields
  end
  # Home
  def self.home
    {title: "Inicio | Bienvenido a Vuelos Codea", options: [[1, "Reservaciones"], [2, "Administrador"], [3, "Salir"]]}
  end
  def self.reservaciones
    {title: "Reservaciones | Dejar en blancon los campos que no nesecites y usar destinos incompletos", options: [[1, "Encuentra tu vuelo"], [2, "Atras"]]}
  end
  def self.admin_login
    {title: "Logeo | Administrador", fields: {email: "Ingrese email", pwd: "Ingrese contraseña"}}
  end
  def self.admin_options
    {title: "Opciones de Administrador | Bienvenido Administrador", options: [[1, "Muestra todos los vuelos"],[2, "Muestra todas las Reservaciones"], [3, "Crea un nuevo vuelo", "Salir"], [4, "ir al menu inicio"]]}
  end
  # Admin
  def self.new_flight
    {title: "Admin | Crear nuevo vuelo", fields: {num_flight: "Numero de vuelo ", date: "fecha ",_from:"Desde ",_to:"Para ", duration: "Duracion ", cost: "Costo ", passengers: "Pasageros "}}
  end
  def self.view_flights
    View.new.flights
    View.new.print_options(send(current))
  end
  def self.view_bookings
    View.new.bookings
    View.new.print_options(send(current))
  end
  # Reservaciones
  def self.encuentra_tu_vuelo
    {screen: :reservaciones, title: "Busqueda de vuelos ", fields: {_from: "Desde ",_to:"A ", date: "Fecha ", free: "No. de acientos que desea comprar"}}
  end
end
