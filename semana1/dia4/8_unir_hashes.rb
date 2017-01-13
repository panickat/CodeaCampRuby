#no usar merge
def join_hash(h1,h2,h3)
  
  r={}
  su(h1,r); su(h2,r); su(h3,r)
end

def su(h,r)
  #[[k,v], [k,v], [k,v]] otra forma
  h.each do |k,v|
    r[k]=v
  end
  r
end

fruit = {name: "pineapple"}
weight = {weight: "1 kg"}
taste = {taste: "good"}
#test
p join_hash(fruit, weight, taste) == {:name=>"pineapple", :weight=>"1 kg", :taste=>"good"} 