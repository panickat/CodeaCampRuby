=begin
def shopping(list)
  basket_shopping = nil
  if basket_shopping == nil
    basket_shopping = list
  end
end

#test
p shopping(["eggs", "milk", "bread", "orange juice"]) == "eggs, milk, bread, orange juice"
=end
def shopping(list)
  basket_shopping = nil
  basket_shopping ||= list.join(", ") 
end

#test
p shopping(["eggs", "milk", "bread", "orange juice"]) == "eggs, milk, bread, orange juice"