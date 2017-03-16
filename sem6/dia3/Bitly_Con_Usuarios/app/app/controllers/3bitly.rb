get "/urls" do
  puts "/urls"
  erb :list_urls
end

get "/:short_url" do
  puts "/:short_url  = #{params[:short_url]}"

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
  p "post /add_url"
  content_type :json
  response = {}

  url = Url.create(long_url: params[:long_url])
  response[:url] = url

  if url.valid?
    response[:success] = true
  else
    response[:success] = false
    response[:errs] = url.errors.messages[:long_url]
  end

  response.to_json
end
