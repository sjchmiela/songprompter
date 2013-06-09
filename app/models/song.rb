class Song < ActiveRecord::Base
  has_many :events_songs
  has_many :events, :through => :events_songs

  def chorus 
    if self.text.index("##")
      return self.text.split("##")[0].strip.gsub(/\n/, "\n<br />")
    else
      return nil
    end
  end

  def verses
    if self.text.index("##")
      return self.text.split("##")[1].split("\r\n\r\n").map { |x| x.strip.gsub(/\n/, "\n<br />") }
    else
      return self.text.split("\r\n\r\n").map { |x| x.strip.gsub(/\n/, "\n<br />") }
    end
  end
end
