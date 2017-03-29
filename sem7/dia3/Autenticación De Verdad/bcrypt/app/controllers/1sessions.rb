# use Rack::Session::Cookie, :key => 'rack.session',
#                            :path => '/',
#                            :expire_after => 86400, # In seconds
#                            :secret => 'secret_stuff'
app_name = "codea"

get '/login' do
  erb :login
end

get '/singin' do
  erb :signin
end

post '/login' do
  content_type :json
  response = {}

  if logged_in?
    response[:success] = true
    response[:redirect_to] = app_name
  else
    env["rack.session"][:authenticate] = nil
    response[:errs] = ["Nombre o contraseña invalidos"]
    response[:success] = false
  end

  response.to_json
end

post '/singin' do
  content_type :json
  response = {}

  u = User.create(params)

  unless u.valid?
    response[:errs] = []
    u.errors.messages.each do |field|
      response[:errs] << "#{field[0]} #{field[1]}"
    end
    response[:success] = false
  else

    response[:success] = true
    response[:redirect_to] = "login"
  end

  response.to_json
end

get "/close_session" do
  env["rack.session"][:authenticate] = nil
  redirect to "/"
end

get "/#{app_name}" do
  redirect to "login" if env["rack.session"][:authenticate].nil?

  current_user # contiene una variable de instancia @

  erb :session_ok
end

get '/*' do
  redirect to "/login"
end
