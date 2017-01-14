=begin
def a 
  true
end

def b
  false
end

def join
  a || b == b && b
end

def check?
  if !!join
    "true" 
  else
    "false"
  end
end

#test
p check? == "true"
=end
def check? ; "true" end 

#test
p check? == "true"