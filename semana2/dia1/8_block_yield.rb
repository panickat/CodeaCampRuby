#método para calcular el promedio de calificaciones
start = Time.now
#code goes here
def average_grade(grades)
  yield grades
end

average= average_grade([8,8,8]){ |g| g.inject{ |suma,n| suma + n }.to_f/g.count}

finish = Time.now
duration = finish - start

p "------------Time started----------"
p "Start time: #{start}";puts
p "Average is: #{average}"
p "End time: #{finish}";puts
p "-------------Time finished--------"
p "Result: #{duration} seconds"
