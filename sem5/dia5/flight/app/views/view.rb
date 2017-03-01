
class View
  include CommandLineReporter

  def initialize(prompt=false)
    @prompt = "Selecciona una opciòn : " if prompt
  end

  def save_ok
    puts "Registrto guardado".green
  end
  def err_cmd
    puts "Opciòn incorrecta".red
    puts "-\(°_o)/¯".red
  end
  def purchase_status(save)
    if save
      Nav.current = Nav.current
      puts "Compra realizada".green
    else
      Nav.current = Nav.current
      puts "Datos incorrectos, no se guardo la compra".red
    end
  end
  def flights_404
    Nav.current = Nav.current
    puts "Ningun vuelo encontrado".red
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
    header(title: " ◣_ #{labels[:title]}  _◢".green + " ヽ(´ー｀)ノ".yellow , align: 'center', width: 130, bold: true)

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
    header(title: " ◣_ #{labels[:title]} _◢" + " (='.'=)".yellow , align: 'center', width: 130, bold: true)

    data ={}
    labels[:fields].each do |item|
      puts item.last
      puts "año mes dia" if item.first == :date
      puts "horas minutos segundos" if item.first == :duration
      print " > "

      if item.first == :pwd
        require 'io/console'
        data[item.first] = STDIN.noecho(&:gets).strip!
      elsif item.first == :date
        data[item.first] = gets.chomp.gsub(/\D/, "-")
      elsif item.first == :duration
        data[item.first] = gets.chomp.gsub(/\D/, ":")
      else
        val = gets.chomp
        val = Integer(val) rescue val
        data[item.first] = val
      end
    end
    data
  end

  #Admin opotions
  def sql_operator(operator)
    operator = Integer(operator) rescue "like"
    operator == "like" ? operator : ">="
  end
  def flights(select_flight = nil)
    if select_flight.nil?
      flights = Flight_view.all
    else
      select_flight.select! {|k,v| v != ""}
      #select_flight.each {|k,v| k == :free ? where << "#{k} >= :#{k}" : where << "#{k} like :#{k}" }
      where = ""
      select_flight.each_with_index do |item, index|
        if index == 0
        where = item[0].to_s + " #{sql_operator(item[1])} ?"
        else
          where += " and " + item[0].to_s + " #{sql_operator(item[1])} ?"
        end
      end

      select_flight[:_to] = select_flight[:_to].to_s + "%" unless select_flight[:_to].nil?
      select_flight[:_from] = select_flight[:_from].to_s + "%"unless select_flight[:_from].nil?

      flights = Flight_view.where(select_flight.values.insert(0, where))
    end


    header(title: "✈ ◣_ #{flights.length} Vuelos disponibles _◢ ✈".green, align: "center", width: 100, bold:true)

    selected_flight = []
    index_flight = 0
    flights.each do |flight|

      index_flight += 1
      selected_flight << { flight: flight, index_flight: index_flight}

      header(title: "✈ ◣_ vuelo No. #{index_flight} _◢ ✈".green, width: 100)
      table border: true do
        row do
          column "vuelo: #{flight.num_flight}", width: 40
          column "", width: 40
          column "", width: 18
        end
        row do
          column "Desde: #{flight._from}"
          column "A: #{flight._to}"
          column "Duracion: #{flight.duration.strftime("%T")}"
        end
        row do
          column "Sale el: #{flight.date.strftime("%Y-%m-%d")}"
          column "A las: #{flight.date.strftime("%T")}"
          column ""
        end
        row do
          column "Precio: #{cost(flight.cost)}"
          column "Lugares: #{flight.passengers}  -  Occupados: #{flight.occupied}"
          column "Libres: #{flight.free}"
        end

      end
    end

    return  flights_404 if flights.count == 0

    unless select_flight.nil?
      print "Selecciona el indice de un vuelo > "
      selected_index = gets.chomp.to_i

      selected_flight = selected_flight.select {|f| f[:index_flight] == selected_index }

      if selected_flight.empty?
        flights_404
      else
        puts "✈ ◣_ Seleccionaste el vuelo No. #{selected_index} a: #{selected_flight.first[:flight][:_to]} _◢ ✈".green
        User.all.each {|u| puts "#{u.id} #{u.name}" }
        puts "Escribe tu numero de usuario:"
        print "> "
        user = gets.chomp.to_i

        puts "Cuantos voletos deseas comprar?"
        print "> "
        tickets = gets.chomp.to_i
        booking = Booking.new(flight_id: selected_flight.first[:flight].id, user_id: user, seatings: tickets)
        purchase_status(booking.save)

      end
    end

  end
  def bookings
    bookings = Booking.select("name, seatings, num_flight, cost, seatings * cost as total").joins("Inner join users on users.id = bookings.user_id inner join flights on bookings.flight_id = flights.id")

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
