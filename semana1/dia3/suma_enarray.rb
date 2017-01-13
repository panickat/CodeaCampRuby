arr,arr2 = Array.new, Array.new

until arr.length == 11
 arr.push(arr.length)
end

arr.each {|a| arr2.push(a + 20)}
p arr2