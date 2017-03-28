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

  env["rack.session"][:authenticate] = User.authenticate(params)
  unless env["rack.session"][:authenticate].nil?
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
