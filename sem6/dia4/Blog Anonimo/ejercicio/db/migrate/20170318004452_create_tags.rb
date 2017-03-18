class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :tag
      t.integer :hits, default: 0

      t.timestamps
    end
  end
end
