class CreateCharacters < ActiveRecord::Migration
  def self.up
    create_table :characters do |t|
      t.string :bnet_profile_url
      t.string :region
      t.string :name
      t.integer :code
      t.integer :bnet_id
      t.integer :portrait_id
      t.integer :portrait_row
      t.integer :portrait_col
      t.string :race
      t.boolean :random
      t.string :division
      t.integer :rank
      t.integer :world_rank
      t.integer :region_rank
      t.string :league
      t.integer :points
      t.integer :wins
      t.integer :losses
      t.timestamps
    end

    change_table :characters do |t|
      t.index :name
      t.index :bnet_id
    end
  end

  def self.down
    drop_table :characters
  end
end
