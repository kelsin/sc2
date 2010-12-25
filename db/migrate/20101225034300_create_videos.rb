class CreateVideos < ActiveRecord::Migration
  def self.up
    create_table :videos do |t|
      # From UStream
      t.integer :ustream_id
      t.string :title
      t.text :description
      t.decimal :length, :precision => 12, :scale => 3
      t.string :url
      t.string :image_url_small
      t.string :image_url_medium

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

      t.timestamps
    end

    change_table :videos do |t|
      t.index :ustream_id
      t.index :my_race
      t.index :vs_race
      t.index :map
      t.index :title
    end
  end

  def self.down
    drop_table :videos
  end
end
