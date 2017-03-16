app_name = "codea"

get '/' do
  erb :home
end

get "/#{app_name}" do
  p "enetro a get app_name* =O"
  authenticate
  erb :container
end
