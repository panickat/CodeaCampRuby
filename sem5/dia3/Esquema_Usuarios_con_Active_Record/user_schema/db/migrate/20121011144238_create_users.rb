# Este archivo debe contener una migración
class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      # Agrega aquí las columnas que faltan
      t.string :last_name
      t.string :gender
      t.date :birthday
      t.string :email
      t.string :phone

      t.timestamps
    end

    create_table :uerrs do |t|
      t.string :first_name
      # Agrega aquí las columnas que faltan
      t.string :last_name
      t.string :gender
      t.date :birthday
      t.string :email
      t.string :phone
      t.string :errs

      t.timestamps
    end
  end

  def down
    drop_table :users
  end
end
