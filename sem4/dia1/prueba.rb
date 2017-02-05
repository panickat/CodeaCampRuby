# a = true
# puts "a = false"  until a
#
# p "bajo el until a = true"
# exit


# class B
#   def initialize
#     @chale = 0
# end
#   def b
#     @chale += 1
#   end
# end
#
# class A
#   def initialize
#     @a = B.new
#   end
#   def a
#     @a
#   end
# end
#
# instancia = A.new
# p instancia
# p instancia.a.b
# p instancia.a.b
class String
  def to_bool
    return true if ['true', '1', 'yes', 'on', 't'].include? self
    return false if ['false', '0', 'no', 'off', 'f'].include? self
    return nil
  end
end
p var = $*[0].to_bool


def metodo(var)
  p "antes rise y rescue"
raise NoEggsError, "The hen has not layed any eggs" unless var
p "despues raise -> antes rescue"
rescue
  p "despues  rescue y rise"
end


metodo(var)
