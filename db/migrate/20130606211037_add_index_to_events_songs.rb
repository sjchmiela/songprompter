class AddIndexToEventsSongs < ActiveRecord::Migration
  def self.up
    add_column :events_songs, :id, :primary_key
  end

  def self.down
    remove_column :events_songs, :id
  end
end
