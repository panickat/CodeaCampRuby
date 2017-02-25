class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.integer :num_flight
      t.date :date
      t.time :depart
      t.string :from
      t.string :to
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
      t.integer :userid
      t.string :pwd
    end

    create_table :userBookings do |t|
      t.integer :flight_id
      t.integer :num_booking
      t.integer :total
    end

  end
end