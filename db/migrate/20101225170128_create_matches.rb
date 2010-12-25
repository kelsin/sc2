class CreateMatches < ActiveRecord::Migration
  def self.up
    create_table :matches do |t|
      t.text :description

      # Sc2 Data
      t.string :map
      t.string :my_race
      t.string :vs
      t.string :vs_race

      # Uploaded Replay
      t.string :replay_file_name
      t.string :replay_content_type
      t.integer :replay_file_size
      t.datetime :replay_updated_at

      # Reference to video
      t.references :video
      t.references :character

      t.timestamps
    end

    change_table :matches do |t|
      t.index :my_race
      t.index :vs_race
      t.index :map
    end
  end

  def self.down
    drop_table :matches
  end
end
