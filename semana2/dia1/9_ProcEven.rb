=begin
Crea el Proc even que identifique números pares. Haz pasar la prueba.

numbers = [2, 4, 7, 10, 23, 34, 45, 42]

#test
p numbers.map(&even) == ["Even", "Even", 7, "Even", 23, "Even", 45, "Even"]
=end

=begin
That means, you have to force the third argument to be a block passing the parameter with the ampersand.

foo(1, 2, &Proc.new { "from the proc" })
1
"from the proc"
2
However, this is a very uncommon syntax. In Ruby, methods with blocks are generally called using {}

foo(1, 2) { "from the block" }
1
"from the block"
2	
=end
	
numbers = [2, 4, 7, 10, 23, 34, 45, 42]

even = Proc.new {|n| n.even? ? "Even" : n }

#test
p numbers.map(&even) == ["Even", "Even", 7, "Even", 23, "Even", 45, "Even"]
