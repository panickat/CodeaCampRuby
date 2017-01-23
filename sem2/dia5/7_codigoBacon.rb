=begin
Código Bacon
El código Bacon es un método para ocultar mensajes.
Cada letra del mensaje se reemplaza por un grupo de cinco letras 'A' o 'B', de acuerdo a la siguiente tabla.
Crea el método baconian_cipher que recibe un mensaje oculto con el código Bacon y regresa el mensaje original.
=end
def baconian_cipher(s)
  s.gsub(/(AAAAA|AAAAB|AAABA|AAABB|AABAA|AABAB|AABBA|AABBB|ABAAA|ABAAB|ABABA|ABABB|ABBAA|ABBAB|ABBBA|ABBBB|BAAAA|BAAAB|BAABA|BAABB|BABAA|BABAB|BABBA|BABBB)/, "AAAAA"=>"a", "AAAAB"=>"b", "AAABA"=>"c", "AAABB"=>"d", "AABAA"=>"e", "AABAB"=>"f", "AABBA"=>"g", "AABBB"=>"h",
   "ABAAA"=>"i", "ABAAB"=>"k", "ABABA"=>"l", "ABABB"=>"m", "ABBAA"=>"n", "ABBAB"=>"o", "ABBBA"=>"p", "ABBBB"=>"q", "BAAAA"=>"r", "BAAAB"=>"s",
    "BAABA"=>"t", "BAABB"=>"v", "BABAA"=>"w", "BABAB"=>"x", "BABBA"=>"y", "BABBB"=>"z")
end
# Pruebas
p baconian_cipher("BAABAAABAAAABAABAAABABBBAAABAABAAAAABBABAAAAAABABAAAAAABAAABAAABAABAAAABBAAAAABAABBAB") == "teesperoalascinco"
p baconian_cipher("ABABAAAAAAAAABAABABAAAAAABAABBAABAAAABAABAAABAAABBABBABBAAABBAABABAAAAAABAABAAAB") == "laclaveesdostres"
