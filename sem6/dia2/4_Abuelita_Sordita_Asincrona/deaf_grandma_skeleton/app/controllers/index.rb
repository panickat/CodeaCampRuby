get '/' do
  p "get controllers /"

  erb :index
end

# get '/:abuelita' do
#   p "get controllers /:abuelita"
#   @abuelita = params[:abuelita]
#
#   erb :index
# end

post '/abuelita' do
  p "post controllers /abuelita"
  grandma_answer(params[:user_input])
end
