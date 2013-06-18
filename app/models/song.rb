class Song < ActiveRecord::Base
  has_many :events_songs
  has_many :events, :through => :events_songs

  def chorus 
    if self.text.index("###")
      return self.text.split("###")[0].strip.gsub(/\r\n/, "<br />")
    else
      return nil
    end
  end

  def verses
    if self.text.index("###")
      return self.text.split("###")[1].split("===").map { |x| x.strip.gsub(/\r\n/, "<br />") }
    else
      return self.text.split("===").map { |x| x.strip.gsub(/\r\n/, "<br />") }
    end
  end
end
