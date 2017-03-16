get '/' do
  erb :index
end

post '/rolls' do
  content_type :json
  rolls = []

  if params[:value]
    3.times { rolls << Roll.create({ value: value }) }
  else
    3.times { rolls << Roll.create }
  end

  win = rolls.map! { |roll| roll.value }.uniq.count == 1 ? true : false

  response = {rolls: rolls, win: win}

  response.to_json
end
