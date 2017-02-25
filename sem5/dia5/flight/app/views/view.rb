
class View
  include CommandLineReporter

  def initialize
    @prompt = "Selecciona una opciòn : "
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
    header(title: labels[:title] + " ヽ(´ー｀)ノ".green , align: 'center', width: 100, bold: true)

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
    header(title: labels[:title] + " (='.'=)".green , align: 'center', width: 50, bold: true)

    data ={}
    labels[:fields].each do |item|
      puts item.last
      print " > "
      if item.first == :pwd
        require 'io/console'
        data[item.first] = STDIN.noecho(&:gets).strip!
      else
        data[item.first] = gets.chomp
      end
    end
    data
  end

end
