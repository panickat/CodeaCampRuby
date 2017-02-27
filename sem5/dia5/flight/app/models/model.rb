class Admin < ActiveRecord::Base
end
class User < ActiveRecord::Base
  belongs_to :bookings
  validates :email, presence: true, uniqueness: true, format: { with: /.+@.+[.].{2,}/, message: "correo no valido" }
end
class Flight < ActiveRecord::Base
  belongs_to :bookings
  validates :num_flight, presence: true
  validates :date, presence: true
  validates :from, presence: true
  validates :to, presence: true
  validates :duration, presence: true
  validates :cost, presence: true
  validates :passengers, presence: true
end
class Booking < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_and_belongs_to_many :flights

  #has_one :bookings
  has_many :flights
  has_many :users
end
