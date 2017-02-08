=begin
Browser Pirata

Este ejercicio buscará que comprendas las funcionalidades básicas de un navegador y te vayas familiarizando con el protocolo que usan para comunicarse los sitios web (HTTP).

¿Sabes realmente cómo funciona un browser?


Pasos que realiza un browser para regresarte una página web:

Usuario especifica la url.
Browser hace un http request.
Browser recibe un http response (información).
Browser procesa la información.
Browser despliega la información con un formato amigable.
En este ejercicio crearemos un programa que realice todas estas actividades. Vamos a utilizar la librería Net::HTTP para traer la página y Nokogiri para parsear el HTML que regresa el servidor.

Investiga como funciona el método de NET::HTTP => .get_response
Objetivos Académicos
Conocer cómo funciona un browser.
Familiarizarse con el protocolo HTTP.
Conocer la estructura de HTML y sus selectores.
Actividades
Recuerda antes de empezar, hacer los requires necesarios para poder usar Net::HTTP y Nokogiri.

Nuestro programa funcionará de la siguiente manera:

url> http://www.codea.mx
Fetching...
Título: CodeaCamp
Links:
  Home: /
  Preguntas Frecuentes: /static_pages/faq
  Trabajo: /static_pages/work
  Empresas: /static_pages/employers
  Escríbenos: /contacts/new
...
url>
Paso 1: Crear la clase Page
La clase Page tendrá los siguientes métodos:

class Page
  def initialize(url)
  end

  def fetch!
  end

  def links
  end

  def title
  end
end
Responsabilidades de la clase:

Recibe una url al crearse.
Sabe hacer un http request y guarda la respuesta para usarse en otros métodos.
Regresa un array de los links de la página (texto/url).
Regresa el título de la página.
Paso 2: Crear el Browser
La clase Browser es la que controlará tu programa.

class Browser
  def run!
  end
end

Browser.new.run!
Piensa en cómo conocerás la url que el usuario quiere.
¿Cómo corres tu programa y cómo el usuario interactúa con él?
¿Qué información está esperando ver desplegada?

Paso 3: Extras
Haz que tu programa sea dinámico.
Que el usuario pueda dar diferentes url's sin tener que correrlo cada vez.
Que el usuario pueda escoger alguno de los links que muestras como su próxima url.
Y que puedan cerrar el programa cuando guste.

De aquí en adelante te reto a que le añadas las funcionalidades que tu imaginación alcance.
=end
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
