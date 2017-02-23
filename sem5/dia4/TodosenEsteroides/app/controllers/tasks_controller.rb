class TasksController
  def initialize(args)
    @view = TasksView.new
    @view.show
    cmds_loop
  end

  def cmds_loop
    prompt = "cmds to use: show task|done, task, done, delete, exit > "
    cmd = ""
    until cmd == "exit"
      print prompt
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

  def task(cmd)
    t = Task.new
    t.name = cmd
    t.save
    @view.show
  end
  def done(cmd)
    cmd = match_index(cmd)
    t = Task.find(cmd)
    t.pending = false
    t.save
    @view.show
  end
  def delete(cmd)
    cmd = match_index(cmd)
    puts "task #{cmd} was deleted =O"
    Task.delete(cmd)
    @view.show
  end
  def match_index(i)
    @view.list_index.select {|row| row[:index].to_i == i.to_i}.first[:id]
  end

end
