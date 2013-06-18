class Event < ActiveRecord::Base
  has_many :events_songs
  has_many :songs, :through => :events_songs

  def desc
    if self.date
      return self.name+" (#{self.date})"
    else
      return self.name
    end
  end
end
