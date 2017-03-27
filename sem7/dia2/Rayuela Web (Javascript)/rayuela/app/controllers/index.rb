get '/login' do
  # Look in app/views/index.erb
  erb :login
end

post '/login' do
  content_type :json
  response = {}

  response[:players] = User.authenticate(params)
  response[:redirect_to] = "/play?"

  response.to_json
end

get "/play" do
  @players = params

  erb :play
end

get "/*" do
  redirect to "/login"
end
