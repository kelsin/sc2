class CreateChannels < ActiveRecord::Migration
  def self.up
    create_table :channels do |t|
      t.string :name
      t.integer :ustream_id
      t.string :url
      t.string :image_url_small
      t.string :image_url_medium
      t.timestamps
    end

    change_table :channels do |t|
      t.index :name
      t.index :ustream_id
    end
  end

  def self.down
    drop_table :channels
  end
end
