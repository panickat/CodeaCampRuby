=begin
def foo(one, two, &block)
  block.call
end
Methods can implicitly accept a block. Implicit blocks are called with yield.

def foo(one, two)
  p yield
end

foo(1, 2) { "from the block" }
=end

def foo(one, two)
  if block_given?
    p yield
  else
    p "No block given"
  end
end

foo(1, 2) { "from the block" }
 => "from the block"

foo(1, 2)
 #=> "No block given"