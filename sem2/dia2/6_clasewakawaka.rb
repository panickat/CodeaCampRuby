=begin
Dado el siguiente código Waka Waka...

< > ! * ' ' #
^ " ` $ $ -
! * = @ $ _
% * < > ~ # 4
Crea la clase WakaWaka con los siguientes métodos:

class WakaWaka

  def initialize(code)
    @code = code
  end  

  def translate
  end
end 
WakaWaka#translate, imprime el código waka waka traducido y formateado como en el siguiente ejemplo:

waka_code.translate
#=>
<         >         !         *         '         '         #         
Waka      waka      bang      splat     tick      tick      hash,
^         "         `         $         $         -         
Caret     quote     back-tick dollar    dollar    dash,
!         *         =         @         $         _         
Bang      splat     equal     at        dollar    underscore,
%         *         <         >         ~         #         4         
Percent   splat     Waka      waka      tilde     hash      four,
=end
=begin
class WakaWaka

  @@lines_toprint = Array.new

  def initialize(code)
  	code = code.gsub(" ","").split("")

  	name_char = Hash.new
  	name_char["<"] = "Waka"
  	name_char[">"] = "waka"
  	name_char["!"] = "bang"
  	name_char["*"] = "splat"
  	name_char["'"] = "tick"
  	name_char["#"] = "hash"
  	name_char["^"] = "Caret"
  	name_char['"'] = 'quote'
  	name_char["`"] = "back-tick"
  	name_char["$"] = "dollar"
  	name_char["-"] = "dash"
  	name_char["="] = "equal"
  	name_char["@"] = "at"
  	name_char["_"] = "underscore"
  	name_char["%"] = "Percent"
  	name_char["~"] = "tilde"
  	name_char["4"] = "four"

  	out_char = ""
  	out_name = ""
  	code.each {|c|  n=10; out_char += c.ljust(n) ; out_name += name_char[c].ljust(n) }
  	
  	@@lines_toprint << out_char
  	@@lines_toprint << out_name.rstrip + ","

  end

  def self.translate
  	
  	@@lines_toprint.each {|s| puts s}

  end

end

name_char = WakaWaka.new("< > ! * ' ' #")
name_char = WakaWaka.new('^ " ` $ $ -')
name_char = WakaWaka.new("! * = @ $ _")
name_char = WakaWaka.new("% * < > ~ # 4")

WakaWaka.translate
=end
class WakaWaka

  @@lines_toprint = Array.new

  def code(s)
  	code = s.gsub(" ","").split("")

  	name_char = Hash.new
  	name_char["<"] = "Waka"
  	name_char[">"] = "waka"
  	name_char["!"] = "bang"
  	name_char["*"] = "splat"
  	name_char["'"] = "tick"
  	name_char["#"] = "hash"
  	name_char["^"] = "Caret"
  	name_char['"'] = 'quote'
  	name_char["`"] = "back-tick"
  	name_char["$"] = "dollar"
  	name_char["-"] = "dash"
  	name_char["="] = "equal"
  	name_char["@"] = "at"
  	name_char["_"] = "underscore"
  	name_char["%"] = "Percent"
  	name_char["~"] = "tilde"
  	name_char["4"] = "four"

  	out_char = ""
  	out_name = ""
  	
  	code.each {|c|  n=10; out_char += c.ljust(n) ; out_name += name_char[c].ljust(n) }
  	
  	@@lines_toprint << out_char
  	@@lines_toprint << out_name.rstrip + ","
  end	

  def self.translate
  	
  	@@lines_toprint.each {|s| puts s}

  end

end

name_char = WakaWaka.new
name_char.code("< > ! * ' ' #")
name_char.code('^ " ` $ $ -')
name_char.code("! * = @ $ _")
name_char.code("% * < > ~ # 4")

WakaWaka.translate