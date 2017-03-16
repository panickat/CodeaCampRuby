class Urls < ActiveRecord::Migration
  def change

    create_table :urls do |t|
      t.string :long_url
      t.string :short_url
      t.integer :hits, default: 0
      t.integer :user_id
    end

    Urlviews.up
  end
end

class Urlviews < ActiveRecord::Migration
  def self.up
    execute <<-SQL
      CREATE VIEW urlviews AS select urls.*, users.name from urls left join users on urls.user_id = users.id;
    SQL
  end
  def self.down
    execute <<-SQL
      DROP VIEW urls_with_user
    SQL
  end
end
