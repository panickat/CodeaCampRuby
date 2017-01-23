def anagrams(arr)

  r=[]
  arr.each do |word|

    c=checklist(word,arr)
    r.push(c) if !r.include?(c)
  end
  r
end

def checklist(w,arr)
  r=[]
    arr.each do |anagram|
       r.push(anagram) if (w.split('') - anagram.split('')).empty?
    end
  r
end

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']
#test
p anagrams(words) == [["demo", "dome", "mode"], ["none", "neon"], ["tied", "diet", "edit", "tide"], ["evil", "live", "veil", "vile"], ["fowl", "wolf", "flow"]]