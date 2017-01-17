def total_between_age(a,min_age,max_age)
a.select{|age| age >= min_age && age <= max_age}.count
end

# Pruebas
p total_between_age([10, 20, 30, 40, 50, 60], 20, 40) == 3
p total_between_age([18, 19, 20, 23, 24, 27], 20, 27) == 4