=begin
xs = [
  ["This code", "is", "indeed"],
  ["very", "compact", "and"],
  ["I hope you will", "find", "it helpful!"],
]
m = xs.map { |_| _.length }
xs.each { |_| _.each_with_index { |e, i| s = e.size; m[i] = s if s > m[i] } }
xs.each { |x| puts m.map { |_| "%#{_}s" }.join(" " * 5) % x }
=end
x = {"foo"=>37, "something long"=>42, "between"=>99}
x.each { |k, v| puts "#{k.ljust(20)} #{v}" }