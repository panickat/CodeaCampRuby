require 'sinatra'
  require "sinatra/activerecord"

  require './models/user.rb'

set :database, {adapter: "sqlite3", database: "db/users.sqlite3", pool: 30}

  get '/' do
    erb :index
  end

  post '/users' do
    #user  = User.new(name: name, email: email) #  name  = params[:name]
    user = User.new(params)

    if user.save
      redirect to("/users/#{user.id}")
    else
      erb :index
    end
  end

  get '/users/:id' do
    @user = User.find(params[:id])
    erb :profile
  end

get '/users' do
  @users = User.all
  erb :users
end

=begin
bundle exec rake db:create
#bundle exec rake db:create_migration NAME=create_users
bundle exec rake db:migrate
=end
