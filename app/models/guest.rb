class Guest < ActiveRecord::Base
	belongs_to :events 
	has_many :potlucks

  attr_accessible :email, :event_id, :alreadyEmailed, :rsvp

  validates :email, :presence => true,
				  :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}
end
