class CreateEventsSongsTable < ActiveRecord::Migration
  def self.up
    create_table :events_songs, :id => false do |t|
        t.references :event
        t.references :song
    end
    add_index :events_songs, [:event_id, :song_id]
    add_index :events_songs, :song_id
  end

  def self.down
    drop_table :events_songs
  end
end
