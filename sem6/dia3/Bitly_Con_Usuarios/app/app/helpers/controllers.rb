helpers do

  def authenticate
    redirect to "/404" if env["rack.session"][:authenticate].nil?
  end

  def plural(number)
    number == 1 ? "" : "s"
  end

end
