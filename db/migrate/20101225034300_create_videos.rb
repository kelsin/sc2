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

      t.references :character

      t.timestamps
    end

    change_table :videos do |t|
      t.index :ustream_id
      t.index :title
    end
  end

  def self.down
    drop_table :videos
  end
end
