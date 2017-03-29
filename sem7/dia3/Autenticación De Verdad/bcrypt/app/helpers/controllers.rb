
helpers do

  def authenticate
    if env["rack.session"][:authenticate].nil?
      redirect to "/404"
    else
       env["rack.session"][:authenticate]
     end
  end

  def current_user

    if env["rack.session"][:authenticate].nil?
      @current_user ||= User.authenticate(params)
      env["rack.session"][:authenticate] = @current_user.nil? ? nil :  @current_user.id
      return @current_user
    else
      @current_user ||= User.find_by_id(env["rack.session"][:authenticate])
    end
  end

  def logged_in?
    !current_user.nil?
  end

end
