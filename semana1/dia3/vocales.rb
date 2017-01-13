
def vowels(a)
 a.scan(/[aeouiAEIOU]/).count
end

p vowels("hello") == 2
p vowels("Magic") == 2
p vowels("Apologize") == 5