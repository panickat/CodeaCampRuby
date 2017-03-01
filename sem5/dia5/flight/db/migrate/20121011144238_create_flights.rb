class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.integer :num_flight
      t.date :date
      t.string :_from
      t.string :_to
      t.time :duration
      t.integer :cost
      t.integer :passengers
    end

    create_table :users do |t|
    	t.string :name
      t.string :email
      t.boolean :admin
    end

    create_table :admins do |t|
      t.integer :user_id
      t.string :pwd
    end

    create_table :bookings do |t|
      t.integer :flight_id
      t.integer :user_id
      t.integer :seatings
    end

    Reservations.up
  end

end
class Reservations < ActiveRecord::Migration
  def self.up
    execute <<-SQL
      CREATE VIEW flight_views AS select *, (passengers - occupied) as free from (Select flights.*, ifnull(sum(seatings), 0) as occupied from flights left join bookings on flights.id = flight_id group by flights.id);
    SQL
  end
  def self.down
    execute <<-SQL
      DROP VIEW flight_views
    SQL
  end
end
