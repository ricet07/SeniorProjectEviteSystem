class Potluck < ActiveRecord::Base
  belongs_to :events
  belongs_to :guests
  attr_accessible :event_id, :guest_id, :item

end
