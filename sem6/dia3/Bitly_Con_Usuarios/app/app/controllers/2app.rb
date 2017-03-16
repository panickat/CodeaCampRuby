app_name = "codea"

get '/' do
  erb :home
end

get "/#{app_name}" do
  @user_id = authenticate
  erb :container
end

get "/close_session" do
  env["rack.session"][:authenticate] = nil
  redirect to "/"
end
