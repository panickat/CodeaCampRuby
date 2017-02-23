 # Este archivo sirve para crear registros de prueba
 def task_status
   [true,false].sample
 end

rand(10..15).times do
  Task.transaction do
    require 'faker'
    row = Task.new
    row.name = Faker::ChuckNorris.fact
    row.pending = task_status
    row.save
  end
end
