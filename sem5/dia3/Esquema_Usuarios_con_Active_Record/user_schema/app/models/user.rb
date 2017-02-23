class User < ActiveRecord::Base
  # validaciones
  validates :email, presence: true, uniqueness: true, format: { with: /.+@.+[.].{2,}/, message: "correo no valido" }
  validates :birthday, presence: true, if: :age_valid?
  validates :phone, format: { with: /.(\d{3}). (\d{3})-(\d{4})/, message: "formato correcto (xxx) xxx-xxxx" }

  #validates :phone, if: :phone_length, format: { with: /.(\d{3}). (\d{3})-(\d{4})/, message: "formato correcto (xxx) xxx-xxxx" }
# def phone_length
#   m = self.phone.match /.(\d{3}). (\d{3})-(\d{4})/
#   errors.add(:phone, "longitud incorrecta") if m.length != 4
# end

def age_valid?
  errors.add(:birthday, "menor de edad") unless adult?  # if self.birthday > 18.years.ago.to_date
end

 def adult?
   return if self.birthday.nil?
   age >= 18 ? true : false
 end

 # Metodos
   def name
     "#{self.first_name} #{self.last_name}"
   end

   def age
     return if self.birthday.nil?
     Time.now.year - self.birthday.year - ((Time.now.month > self.birthday.month || (Time.now.month == self.birthday.month && Time.now.day >= self.birthday.day)) ? 0 : 1)
   end
end

class Uerr < ActiveRecord::Base

end
