def error_message(name, credit_card_type, credit_card_number)
  n=credit_card_number, l= credit_card_number.length, credit_card_type= credit_card_type.upcase
  n=n[0][l-3,3]
  respuesta= "#{name}, The #{credit_card_type} Credit Card Number 'xxx-#{n}' You Provided is Invalid."
end

#Pruebas
p error_message('Rodrigo', 'American Express', '205782460166975') == "Rodrigo, The AMERICAN EXPRESS Credit Card Number 'xxx-975' You Provided is Invalid."
p error_message('Carla', 'Visa', '3912888888881881') == "Carla, The VISA Credit Card Number 'xxx-881' You Provided is Invalid."