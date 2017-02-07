require 'net/http'
require 'nokogiri'
require 'open-uri'

class Page
  def initialize(url)
    @url = url
    @doc = Nokogiri::HTML(open(@url))
    puts "Fetching..."
    puts "Título: #{title} \nLinks:"
    links
  end

  def fetch!
    fetched_url = Net::HTTP.get_response(URI(@url))
    fetched_url.body
  end

  def links
    @links = @doc.search('a').select do |x|
      x.inner_text != ""
    end
    @links.each_with_index {|x,i| puts "#{i + 1} #{x.inner_text.strip}: #{x['href']}" }
  end

  def title
    @title = @doc.search('title').inner_text
  end
end

class Browser
  def run!
    puts "url"
    response = gets.chomp
    temp = response
    while response != "exit"
      if response.to_i != 0
        inside_page = Page.new(temp).links[response.to_i - 1]['href']
        Page.new("#{temp}#{inside_page}")
        puts "url"
        p response
        response = gets.chomp
        if response == "exit"
          break
        else
          Page.new(response)
        end
      end
      Page.new(response)
      puts "url"
      p response
      response = gets.chomp
    end
  end
end

Browser.new.run!

#http://www.codea.mx/
