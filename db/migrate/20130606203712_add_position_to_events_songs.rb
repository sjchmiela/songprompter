class AddPositionToEventsSongs < ActiveRecord::Migration
  def change
    add_column :events_songs, :position, :integer
  end
end
