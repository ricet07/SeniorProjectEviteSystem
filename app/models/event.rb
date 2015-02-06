class Event < ActiveRecord::Base
	has_many :locations
	has_many :potlucks, :dependent => :destroy
	belongs_to :users
	has_many :guests, :dependent => :destroy
    has_many :comments
	attr_accessible :locations_attributes, :time, :date, :hostEmail, :guestPass, :guestlist_privacy, :rsvp_choices, :potlucks_attributes, :guests_attributes, :address, :city, :description, :hostName, :image, :location, :phoneNum, :potluck, :state, :title, :eventType, :user_id, :zip
	accepts_nested_attributes_for :guests, :reject_if => lambda { |a| a[:email].blank? }, :allow_destroy => true
	accepts_nested_attributes_for :potlucks, :reject_if => lambda { |a| a[:item].blank? }, :allow_destroy => true

validates_presence_of :title,:hostName, :address, :location, :city, :state, :zip, :guestPass, :rsvp_choices
validates_length_of :zip, :minimum => 5, :maximum => 5
validates_numericality_of :zip 
validates :date, :presence => true,
				  :format => {:with => /(0[1-9]|1[012])[- \/.](0[1-9]|[12][0-9]|3[01])[- \/.](19|20)\d\d/}
validates :time, :presence => true,
				  :format => {:with => /^([0]?[1-9]|[1][0-2]):([0-5][0-9]|[1-9]) [ap]m$/}
validates :phoneNum, :presence => true,
				  :format => {:with => /^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/}

  has_attached_file :image, :styles => { :small => "<250x250>" }

end
