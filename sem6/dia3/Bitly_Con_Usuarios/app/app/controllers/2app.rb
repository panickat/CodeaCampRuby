app_name = "codea"

get '/' do
  erb :home
end

get "/#{app_name}" do
  @user_id = authenticate
  erb :container
end

post "/close_session" do
  env["rack.session"][:authenticate] = nil
end
