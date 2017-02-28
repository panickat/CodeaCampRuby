
class View
  include CommandLineReporter

  def initialize
    @prompt = "Selecciona una opciòn : "
  end

  def save_ok
    puts "Registrto guardado".green
  end
  def err_cmd
    puts "Opciòn incorrecta".red
    puts "-\(°_o)/¯".red
  end
  def admin_error_login
    puts "Correo o contraseña incorrectos".red
    puts "┐(-｡ｰ;)┌".red
  end
  def end_program
    puts "bon boallage!".bold
    puts ":D".bold
    puts "/" + "█".black + "\\"
    puts "." + "Π".black + "."
  end
  def prompt
    print @prompt
  end

  def print_options(labels)
    header(title: " ◣_ #{labels[:title]}  _◢".green + " ヽ(´ー｀)ノ".yellow , align: 'center', width: 100, bold: true)

    table do
      labels[:options].each do |item|
        row do
          column "#{item[0]})".bold + " #{item[1]}", width: 50
        end
      end
    end
    puts ""
  end
  def print_fields(labels)
    header(title: " ◣_ #{labels[:title]} _◢" + " (='.'=)".yellow , align: 'center', width: 50, bold: true)

    data ={}
    labels[:fields].each do |item|
      puts item.last
      print " > "
      if item.first == :pwd
        require 'io/console'
        data[item.first] = STDIN.noecho(&:gets).strip!
      else
        val = gets.chomp
        val = Integer(val) rescue val
        data[item.first] = val
      end
    end
    data
  end

  #Admin opotions
  def flights(select_flight = nil)

    if select_flight.nil?
      flights = Flight.select("flights.*, (passengers - seatings) as free").joins("left join bookings on flights.id = bookings.flight_id")
    else
      where =[]
      select_flight.select! {|k,v| v != ""}
      select_flight.each do |k,v|
        k == :seatings ? where << "#{k} >= :#{k}" : where << "#{k} = :#{k}"

      end
      where = "(#{where.join(" and ")}) or seatings is null"

      flights = Flight.select("flights.*, (passengers - seatings) as free").joins("left join bookings on flights.id = bookings.flight_id").where(where, select_flight)
      gets.chomp
    end


    header(title: "✈ ◣_ #{flights.length} Vuelos disponibles _◢ ✈".green, align: "center", width: 100, bold:true)

    selected_flight = []
    index_flight = 0
    flights.each do |flight|

      index_flight += 1
      selected_flight << { flight: flight, index_flight: index_flight}

      header(title: "✈ ◣_ vuelo No. #{index_flight} _◢ ✈".green)
      table border: true do
        row do
          column "vuelo: #{flight.num_flight}", width: 40
          column "", width: 40
          column "", width: 18
        end
        row do
          column "Desde: #{flight.from}"
          column "A: #{flight.to}"
          column "Duracion: #{flight.duration.strftime("%T")}"
        end
        row do
          column "Sale el: #{flight.date.strftime("%Y-%m-%d")}"
          column "A las: #{flight.date.strftime("%T")}"
          column ""
        end
        row do
          column "Precio: #{cost(flight.cost)}"
          column "Lugares: #{flight.passengers}"
          column "disponibles: #{flight.free.nil? ? flight.passengers : flight.free}"
        end

      end
    end
    unless select_flight.nil?
      print "Selecciona el indice de un vuelo > "
      selected_index = gets.chomp.to_i
      selected_flight = selected_flight.select {|f| f[:index_flight] == selected_index }

      if selected_flight.empty?
        puts "ese vuelo no existe".red
      else
        puts "✈ ◣_ Seleccionaste el vuelo No. #{selected_index} a: #{selected_flight.first[:flight][:to]} _◢ ✈".green
        User.all.each {|u| puts "#{u.id} #{u.name}" }
        puts "Escribe tu numero de usuario:"
        print "> "
        user = gets.chomp.to_i

        puts "Cuantos voletos deseas comprar?"
        print "> "
        tickets = gets.chomp.to_i

        booking = Booking.new(flight_id: selected_flight.first[:flight][:id], user_id: user, seatings: tickets)
        if booking.save
          puts "Compra realizada".green
        else
          puts "Datos incorrectos, no se guardo la compra".red
        end

      end
    end
  end
  def bookings(booking_id = 0)
    if booking_id > 0
      bookings = Booking.select("name, seatings, num_flight, cost, seatings * cost as total").joins("Inner join users on users.id = bookings.user_id inner join flights on bookings.flight_id = flights.id").where("num_flight = ? ", booking_id)
      if bookings.empty?
        puts "Ese id no existe".red
        return
      end
    else
      bookings = Booking.select("name, seatings, num_flight, cost, seatings * cost as total").joins("Inner join users on users.id = bookings.user_id inner join flights on bookings.flight_id = flights.id")
    end

    header(title: "✈ ◣_ #{bookings.length} Reservaciones _◢ ✈".green, align: "center", width: 100, bold:true)

    bookings.each do |ticket|
      table border: true do
        row do
          column "Nombre: #{ticket.name}", width: 25
          column "Vuelo: #{ticket.num_flight}", width: 12
          column "Lugares: #{ticket.seatings}", width: 11
          column "Costo: #{cost(ticket.cost)}", width: 20
          column "Total: #{cost(ticket.total)}", width: 20
        end
      end
    end

  end
  def cost(str)
    "$ #{ str.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse} mxn"
  end
end
