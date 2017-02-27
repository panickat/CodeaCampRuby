class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.integer :num_flight
      t.date :date
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
      t.integer :user_id
      t.string :pwd
    end

    create_table :bookings do |t|
      t.integer :flight_id
      t.integer :user_id
      t.integer :seatings
    end

  end
end
