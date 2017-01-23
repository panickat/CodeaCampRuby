#Un año es bisiesto en el calendario Gregoriano, 
#si es divisible entre 4, excepto aquellos divisibles entre 100 pero no entre 400.
def leap_year?(año)
  (año%4==0 && año%100!=0)||(año%400==0);
end
# Pruebas

p leap_year?(1900) == false
p leap_year?(1988) == true
p leap_year?(1989) == false
p leap_year?(1992) == true
p leap_year?(2000) == true
p leap_year?(2001) == false
p leap_year?(1600) == true  
p leap_year?(1704) == true