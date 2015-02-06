class Location < ActiveRecord::Base
  belongs_to :events
  attr_accessible :address, :latitude, :longitude, :event_id
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
end
