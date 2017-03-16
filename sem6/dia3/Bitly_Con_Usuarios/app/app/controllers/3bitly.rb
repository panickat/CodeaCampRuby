                       
get "/urls" do
  erb :list_urls
end

get "/:short_url" do
  url = Url.where("short_url = '#{params[:short_url]}'").first

  if url.nil?
    erb :fail
  else
    url.hit
    if url.save
      redirect url.long_url
    else
       "No se pudo guardar el hit y no se re direcciono"
     end
  end
end

post "/add_url" do
  content_type :json
  response = {}

  params[:user_id] = env["rack.session"][:authenticate] unless env["rack.session"][:authenticate].nil?

  url = Url.create(params)
  response[:url] = url

  if url.valid?
    response[:success] = true
  else
    response[:success] = false
    response[:errs] = url.errors.messages[:long_url]
  end

  response.to_json
end
