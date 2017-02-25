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
  def prompt
    print "cmds to use: show task|done, task, done, delete, exit " + "> ".bold
  end
  def bye
    puts "bye! ヽ(´ー｀)ノ".light_green
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
    i = 0
    list_index = []
    list.each do |row|
      i += 1
      list_index << {index: i, name: row[:name], pending: row[:pending], id: row[:id]}
    end

    list_index.each {|row| puts pending_color?(row[:pending], "#{row[:index]}).-") + " #{row[:name]} #{pending_color?(row[:pending])}" }
    puts "#############     ################     #####\n\r".black
    @list_index = list_index
  end
  def list_index
    @list_index
  end
  def pending_color?(pending, str="")
    case str
    when ""
      pending ? "┐(-｡ｰ;)┌".colorize(:color => :red) : "(='.'=)".colorize(:color => :light_green)
    else
      pending ? str.red : str.blue
    end
  end

  def error_cmd
    puts "this is not a correct command".bold +  " -\(°_o)/¯".red
  end
end
