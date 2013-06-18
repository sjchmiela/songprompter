class EventsSong < ActiveRecord::Base
  belongs_to :event
  belongs_to :song
  default_scope :order => 'position'
end
