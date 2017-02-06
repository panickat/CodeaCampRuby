def foo(bar: "caca")
  puts bar
end

foo # => ArgumentError: missing keyword: bar
foo(bar: 'baz') # => 'baz'
