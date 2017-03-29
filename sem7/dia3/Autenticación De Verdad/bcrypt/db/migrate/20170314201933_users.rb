class Users < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :mail
      t.string :pwd
      t.string :password_digest
    end
  end
end
