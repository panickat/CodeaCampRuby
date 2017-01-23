def multiplication_tables(n)
  
  line = Array(1..10)

  (1..n).each do |i|
   
  s=4
  puts i.to_s.ljust(s) + (i*2).to_s.ljust(s) + (i*3).to_s.ljust(s) + (i*4).to_s.ljust(s) + (i*5).to_s.ljust(s) +
   (i*6).to_s.ljust(s) + (i*7).to_s.ljust(s) + (i*8).to_s.ljust(s) + (i*9).to_s.ljust(s) + (i*10).to_s.ljust(s)
  
  end
end

multiplication_tables(10)