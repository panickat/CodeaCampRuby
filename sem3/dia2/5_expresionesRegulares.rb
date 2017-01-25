=begin
Expresiones Regulares

Cuando se trata de trabajar, procesar y manipular un string las expresiones regulares son una herramienta muy poderosa. Aunque puede parecer complicado entender como usarlas una vez que las empiezas a usar comprenderás su poder y la elegancia con la que manipulan strings. Muchos de los métodos nativos de Ruby para strings utilizan estas expresiones.

Las Expresiones regulares se utilizan mucho en las barras de búsqueda o buscadores para poder ir encontrando patrones en textos.

Enlaces Externos
Te recomendamos mucho leer estos enlaces te serán de mucha ayuda.

Ruby for Newbies
rubular.com
Regex 101
Pickaxe Guide
Regex Overview
Objetivos Académicos
Comprender la sintaxis de las expresiones regulares
Aprender a usar expresiones regulares junto con métodos de Ruby
Actividades
Deberás completar los siguientes métodos para que realicen lo que se indica en el comentario.

Un banco utiliza el siguiente formato en sus números de cuenta: "1234-123-123"

Crea los siguientes métodos que reciban un string parecido a los siguientes:

string_con_un_numero_de_cuenta = "El Cliente con el número de cuenta 1234-123-123 se encuentra en proceso de revisión de sus documentos"
string_con_un_numero_de_cuenta_no_valido = "El Cliente con el número de cuenta 4-12-12 se encuentra en proceso de revisión de sus documentos"
string_con_mas_de_un_numero_de_cuenta = "Hay que transferir los fondos de la cuenta 1234-123-123 a la cuenta 4321-321-311"
Piensa bien como nombrar a cada uno. Adicional deberás crear cuatro pruebas en el Driver Code para cada método.

Métodos:

Regresa true si encuentra un numero de cuenta.
Regresa un número de cuenta si existe dentro del string y nil en el caso contrario.
Regresa un array con los números de cuenta que existen dentro del string y un array vacío en el caso contrario.
Regresa un string donde si existen números de cuenta estos tendran remplazados por "X" los primeros siete numeros. ej. "XXXX-XXX-234"
Regresa un string formateado donde cualquier número de diez dígitos seguido o si tiene puntos en vez de guiones lo regresa a su formato original donde usa guiones para dividir los diez dígitos. Si encuentra un numero de menos dígitos no debería remplazarlo.
=end
class Account
  attr_reader :match, :accounts, :acc_f
  attr_reader :match_err, :err_acc, :error_acc_f
  attr_reader :match_err_large, :err_acc_large, :error_acc_f_large

  def initialize(l, s, f)
    @large = l
    @separator = s
    @format = f.to_s.split("")
    @acc_f = 0
    @error_acc_f = 0
    @error_acc_f_large =0
    @match = false
    @match_err = false
    @match_err_large = false
    @accounts = []
    @err_acc = []
    @err_acc_large = []
  end
  def get=(str)
    @accounts = extract(str,@separator)
    @match = @accounts.empty?
    @acc_f = @accounts.length if @match == true

    @err_acc = extract(str,"[ ,._\\-+*#]?","1,")
    @match_err = @err_acc.empty?
    @error_acc_f = @err_acc.length if @match_err == true

    @accounts.each do |acc|
      @err_acc.select! do |err|
        err != acc && err.length >= 10
      end
    end

    @err_acc_large = extract(str,"[ ,._\\-+*#]?", "1,")
    @match_err_large = @err_acc_large.empty?
    @error_acc_f_large = @err_acc_large.length if @match_err_large == true

    @err_acc_large.select! {|s| s.length < 10}
  end
  def fix
    @err_acc.collect do |c|
      case c.length
      when 10
        "#{c[0..3]}-#{c[4..6]}-#{c[7..9]}}"
      when 12
        c.gsub!(/[ ,._\-+*#]?/,"")
        "#{c[0..3]}-#{c[4..6]}-#{c[7..9]}}"
      end
    end
  end

  def extract(str, separator, bad_large_str="")
    re = ""
    start = true
    @format.each  do |e|
      case start
      when true
        start = false
        re = "\\" + "d{#{bad_large_str + e}}"
      when false
        re += "#{separator}\\" + "d{#{bad_large_str + e}}"
      end
    end
    # Regexp.new(Regexp.escape(re)) # str.match(re)
    str.scan( Regexp.new(re) )
  end

end

acc = Account.new(10, "-", 433)
acc.get = "El Cliente con el número de cuenta 1234-123-123 se encuentra en proceso de revisión de sus documentos"
p acc.accounts == ["1234-123-123"]
acc.get = "El Cliente con el número de cuenta 4-12-12 se encuentra en proceso de revisión de sus documentos"
acc.err_acc_large
acc.get = "Hay que tra0123456789nsferir los fondos de la 4-12-12 cuenta 1234-123-123 a la cuenta 4321-321.311"
p acc.accounts
p acc.err_acc
p acc.err_acc_large
p acc.fix
