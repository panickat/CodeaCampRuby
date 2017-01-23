
def replace_vowels(a)
  a.each { |b| b.gsub!(/[aeiou]/,"x") }
end

p replace_vowels(["banana", "apple"]) == ["bxnxnx", "xpplx"]