class EventsSong < ActiveRecord::Base
  belongs_to :event
  belongs_to :song
end
