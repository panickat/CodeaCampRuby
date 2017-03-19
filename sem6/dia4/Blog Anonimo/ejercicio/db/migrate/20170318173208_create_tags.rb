class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :tag
      t.integer :hits, default: 0

      t.timestamps
    end

    CreateMaxHits.up
  end
end

class CreateMaxHits < ActiveRecord::Migration
  def self.up
    execute <<-SQL
      CREATE VIEW maxhits AS select max(hits) from tags;
    SQL
  end
  def self.down
    execute <<-SQL
      DROP VIEW maxhits
    SQL
  end
end
