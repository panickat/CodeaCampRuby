get '/' do
  erb :index
end

get '/:new_word' do
  @items = {word: params[:new_word]}
  canonical = params[:new_word].downcase.chars.sort.join
  word = Word.where("canonical like '#{canonical}'").first

  @items[:anagrams] = word.anagrams.collect { |item| item.word } unless word.nil?

  erb :word
end

post '/new_word' do
  redirect to ("/#{params[:user_word]}")
end
