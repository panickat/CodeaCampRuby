arr = ["c", "b", "a"]
p arr = arr.product(Array(1..3))
p arr.last.delete(arr.last.first) == "a"
#=>true 