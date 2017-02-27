class Controller
  def initialize(args)
    @view = View.new
    @nav = Nav.new
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
    unless @nav.move?
      case @nav.current
      when :home
        @view.print_options(@nav.home)
      end
      @nav.move = true
    end

    @view.prompt
    option = STDIN.gets.chomp.to_i

    case @nav.current
    when :home
      home(option)
    when :admin_options
      admin(option)
    end
  end

  def home(option)
    case option
    when 1
      select_flight(@view.flights(select_flight: true))
    when 2
      #encuentra tu vuelo
    when 3
      if admin_exists?(@view.print_fields(@nav.admin_login))
        @view.print_options(@nav.admin_options)
      else
         @nav.move = false
         @nav.current = :home
         @view.admin_error_login
      end
    when 4
      "Salir"
    else
      @view.err_cmd
      @nav.move = true
    end
  end

  def select_flight(flights)
    
  end

  def admin(option)
    case option
    when 1
      @view.flights
    when 2
      @view.bookings
    when 3
      new_flight(@view.print_fields(@nav.new_flight))
    when 4
      @nav.move = false
      @nav.current = :home
    else
      @view.err_cmd
    end
  end

  def new_flight(flight)
    row = Flight.new(flight)
    row.save
    while row.valid? == false do
      errors = Nav.new.new_flight
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
  attr_accessor :current, :previous, :next, :move

  def initialize
    @current = :home
    @move = false
  end
  def move?
    @move
  end

  def home
    @current = :home
    {screen: :home, title: "Inicio | Bienvenido a Vuelos Codea", options: [[1, "Reservaciones"],[2, "Encuentra tu vuelo"], [3, "Administrador"], [4, "Salir"]]}
  end
  def admin_login
    @current = :admin_login
    {screen: :admin_login, title: "Logeo | Administrador", fields: {email: "Ingrese email", pwd: "Ingrese contraseña"}}
  end
  def admin_options
    @current = :admin_options
    @move = true
    {screen: :admin_options, title: "Opciones de Administrador | Bienvenido Administrador", options: [[1, "Muestra todos los vuelos"],[2, "Muestra todas las Reservaciones"], [3, "Crea un nuevo vuelo", "Salir"], [4, "ir al menu inicio"]]}
  end
  def new_flight
    @current = :admin_options
    {screen: :admin_options, title: "Admin | Crear nuevo vuelo", fields: {num_flight: "Numero de vuelo ", date: "fecha ", from: "Desde ", to: "Para ", duration: "Duracion ", cost: "Costo ", passengers: "Pasageros "}}
  end

end
# {title: "¡¡Bienvenido!!", options: ["Encuentra tu boleto de aviòn", "Salir"]}
# {title: "!!Encuentra tu vuelo¡¡", fields: [:From, :To, :Date, :Passengers]}# Buscar flights
# {title: "Datos Personales", fields: [:Nombre, :Email]}
