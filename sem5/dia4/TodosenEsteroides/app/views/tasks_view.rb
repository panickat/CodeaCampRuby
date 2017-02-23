class TasksView
	# Recuerda que la única responsabilidad de la vista es desplegar data al usuario
  require 'colorize'

  def show
      list = Task.all
      if list.empty?
        puts "Nice not task today ...".green
      else
        puts "List To do:".blue
        print_todo(list)
      end
  end

  def show_done
    puts "Good work all this task are done .. =D".green
    print_todo(Task.where("pending = ?",false))
  end
  def show_task
    puts "Cheer up! all this task are pending .. =/".yellow
    print_todo(Task.where("pending = ?",true))
  end

  def print_todo(list)
    list.each {|row| puts pending_color?(row.pending, "#{row.id}).-") + " #{row.name} #{pending_color?(row.pending)}" }
    puts "#############     ################     #####\n\r".black
  end
  def pending_color?(pending, str="")
    case str
    when ""
      pending ? ":-(".colorize(:color => :light_blue, :background => :red) : ":-D".colorize(:color => :green, :background => :blue)
    else
      pending ? str.red : str.blue
    end
  end

  def error_cmd
    puts "this is not a correct command =P".red
  end
end
