class CreateRayuelaTables < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
    end

    create_table :games do |t|
      t.belongs_to :user, index: true # id del user ganador

      t.timestamps
    end

    create_table :batches, id: false do |t| #lote
      t.belongs_to :user, index: true
      t.belongs_to :game, index: true
    end
  end
end
