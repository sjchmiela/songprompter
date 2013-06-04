class Event < ActiveRecord::Base
  has_and_belongs_to_many :songs

  def desc
    if self.date
      return self.name+" (#{self.date})"
    else
      return self.name
    end
  end
end
