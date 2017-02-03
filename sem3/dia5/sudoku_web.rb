# http://blog.davidsingleton.org/sudoku/

# https://en.wikibooks.org/wiki/Ruby_Programming/Syntax/Variables_and_Constants
# $&	$MATCH	The string matched by the last successful pattern match in this scope.
# $`	$PREMATCH	The string to the left of the last successful match.
# $'	$POSTMATCH	The string to the right of the last successful match.
# Concatenacion: ["z"] . << "a" << "b" => ["z", "ab"]  ##   ["z"] << "a" << "b" => ["z", "a", "b"]   ##   "a" << "b" => "ab"
# =* combierte en array
# =~ Regresa la posicion de la cadena buscada -> m1 = /Ruby/.match("El futuro es Ruby") m2 = "El futuro es Ruby" =~ /Ruby/

=begin
$*.map{|a|(i=a=~/0/)?(v=*?1..?9).fill{|j|v-=[a[j+i-k=i%9],a[
k+j*=9],a[j%26+i-i%3-i%27+k]]}+v.map{|k|$*.<<$`<<k<<$'}:p(a)}
"702806519100740230005001070008000002610204053200000100070400800064078005821503907"
=end

result =  $*.map do |a|

  i = a =~ /0/
  v =* (?1..?9)

  if i.nil? == false

    p "inicial v: #{v.join(" ")}"
    v.fill { |j|
      p horizontal = a[j + i - k = i % 9]
      p vertical = a[k + j *= 9]
      p cuadrante = a[j % 26 + i - i % 3 - i % 27 + k]

      v -= [horizontal, vertical, cuadrante]
      p "final v: #{v.join(" ")}"
      } + v.map do |k|
        p "k: #{k}"
        p a
        p "left: #{$`}  right: #{$'}"
        p $*.<<$`<<k<<$'
      end
    end
  end
p result[0].last.last
