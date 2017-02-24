class Controller
  def initialize(args)
    @view = View.new
  end
  def cmds_loop
    cmd = ""
    until cmd == "exit"
      print @view.prompt
      cmd = case_cmds(STDIN.gets.chomp)
    end
    puts "bye! ;)"
  end
  def case_cmds(cmd)
    if cmd == "show"
      @view.show
    elsif cmd.include?("show task") == false && cmd.include?("task ") == true
      task(cmd[5..cmd.length - 1])
    elsif cmd.include?("show done") == false && cmd.include?("done ") == true
      done(cmd[5..cmd.length - 1])
    elsif cmd.include?("show done") == true
      @view.show_done
    elsif cmd.include?("show task") == true
      @view.show_task
    elsif cmd.include?("delete ") == true
      delete(cmd[7..cmd.length - 1])
    elsif cmd == "exit"
      cmd
    else
      @view.error_cmd
    end

  end

  def index
    # TIP: Aquí debes de llamar al método del mismo nombre de @view
  end

  def add

  end

  def delete
  end

  def complete
  end
end
