
helpers do

  def authenticate
    if env["rack.session"][:authenticate].nil?
      redirect to "/404"
    else
       env["rack.session"][:authenticate]
     end
  end

  def plural(number)
    number == 1 ? "" : "s"
  end

end
