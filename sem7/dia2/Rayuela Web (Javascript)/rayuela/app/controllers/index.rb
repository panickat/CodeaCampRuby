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

post "/save_game" do
  content_type :json
  response = {}

  params[:players].collect!(&:to_i)
  game = Game.create!(user_id: params[:winner].to_i)
  params[:players].each {|user_id| Batch.create!(user_id: user_id, game_id: game.id) if params[:winner].to_i != user_id }

  response = get_winners(params)
  response.to_json
end

post "/batch_statistics" do
  content_type :json
  response = {}

  params[:players].collect!(&:to_i)

  response = get_winners(params)
  response.to_json
end

get "/*" do
  redirect to "/login"
end
