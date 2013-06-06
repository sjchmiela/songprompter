class Song < ActiveRecord::Base
  has_many :events_songs
  has_many :events, :through => :events_songs
end
