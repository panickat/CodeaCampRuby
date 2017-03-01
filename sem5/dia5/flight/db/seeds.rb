require 'faker'
u = User.create(name: "admin", email: "", admin: true)
Admin.create(user_id: u.id, pwd: "")

from, to  = [],[]
rand(1..5).times do
  User.create(name: Faker::GameOfThrones.character, email: Faker::Internet.email, admin: false)

  from << "#{Faker::Address.country}- #{Faker::GameOfThrones.city}"
  to << "#{Faker::Address.country}- #{Faker::Pokemon.location}"
end

rand(10..15).times do
  Flight.create(num_flight: Faker::Number.number(5), date: Faker::Date.forward(30), _from: from.sample, _to: to.sample, duration: Faker::Time.forward(23).strftime("%T"), cost: rand(1500..10000), passengers: rand(5..10))
end

maxbookings = Flight.all.count * User.all.count
percent_free = (maxbookings * 0.2).to_i

(percent_free).times do
  flight_id = rand(1..Flight.all.count - 1)

  #seatings = Flight.find(flight_id).passengers
  flight = Flight_view.where("id = ?", flight_id)
  if flight.first.free > 0
    seatings = rand(1..flight.first.free)
    Booking.create(flight_id: flight_id, user_id: rand(2..User.all.count - 1), seatings: seatings)
  end
end
