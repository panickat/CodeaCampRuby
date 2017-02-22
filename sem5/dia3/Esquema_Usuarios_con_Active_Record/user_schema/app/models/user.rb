class User < ActiveRecord::Base
# Implementa los métodos y validaciones de tu modelo aquí.
  def name
    "#{self.first_name} #{self.last_name}"
  end
  def age
    Time.now.year - self.birthday.year - ((Time.now.month > self.birthday.month || (Time.now.month == self.birthday.month && Time.now.day >= self.birthday.day)) ? 0 : 1)
  end
end
