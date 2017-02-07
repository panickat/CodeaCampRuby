class Page

  def initialize(url:, html:)
    @html = html
    @url = url
  end

  def fetch!
    puts "Fetching ..."
    return @html unless @html.nil?
    require 'net/http'
    puts "\n" + @url + "\n"
    url = URI.parse(@url)
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) {|http| http.request(req) }
    @html = res.body
  end

  def links
    fetch! if @html.nil?
    require 'nokogiri'

    noko_doc = Nokogiri::HTML(@html)
    @mylinks = noko_doc.css("a").select {|link| link.text != ""}
  end

  def title
    @title = @doc.search('title').inner_text
  end
end

class Browser
  def initialize(url="codea")
    if ARGV.empty?
        if File.file?(url)
          @domain = "http://codea.mx/"
          return @page = File.read("codea")
        else
          url = ""
          while url.length == 0
            print "Escribe un nombre de dominio > "
            url = STDIN.gets.chomp
          end
          @domain = url
        end
    else
      @domain = ARGV[0]
    end
    checkdomain
  end

  def checkdomain
    @domain = "http://" + @domain unless @domain.include?("http://") || @domain.include?("https://")
    @domain += "/" unless @domain[@domain.length - 1] == "/"
  end
  def subdomain(str="")
    if str != ""
      str += "/" unless str[str.length - 1] == "/"
      p "#{@domain}#{str}"
    else
      p @domain
    end
  end

  def run!
    require 'colorize'

    from_prompt = ""
    while from_prompt != "exit"

      puts "Domain: #{@domain}"
      from_prompt = "#{subdomain(from_prompt)}"
      page = Page.new(url: from_prompt, html: @page)
      from_prompt = ""

      l = page.links
      l.each_with_index {|item,i| puts "#{(i + 1).to_s.colorize(:red)}: #{item.text.strip} | #{item['href'].colorize(:red)}" } unless l.nil?

      print "Enter -> regresa al inicio | new -> nueva pagina| opciones validas en rojo: > "
      @page = nil
      from_prompt = STDIN.gets.chomp

      if from_prompt.to_i > 0 && l.empty? == false
        index = from_prompt.to_i - 1
        from_prompt = l[index]["href"][1..l[index]["href"].length - 1] + "/"
      elsif from_prompt == "new"
        print "Escrive un nuevo dominio: > "
        @domain = STDIN.gets.chomp
        from_prompt = ""
      end
      checkdomain
    end
  end

end

browser_pirata = Browser.new
browser_pirata.run!
